//
//  ListInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class ListInteractor<T> where T: Storable, T: Listable {
    
    let network: NetworkType
    let store: StoreType
        
    init(network: NetworkType, store: StoreType) {
        self.network = network
        self.store = store
    }
    
    func fetch(completion: @escaping ([T]) -> ()) {
        let requests: [ReadRequestType] = [IndexRequest(limit: 30, offset: 0)]
        let request: ReadRequestsType = IndexRequests(model: T.model, properties: T.properties, requests: requests)
        self.network.read(requests: request) { response in
            let responses: [ReadResponseType] = response.responses()
            if responses.count > 0 {
                // TODO: Don't Hide Serialization Error
                let objects = responses[0].objects().flatMap({ T(json: $0) })
                return completion(objects)
            }
        }
    }
    
    func persist(storables: [T]) {
        let requests: [WriteRequestType] = storables.map({ CreateRequest(object: $0.toJSON()) })
        let request: WriteRequestsType = CreateRequests(model: T.model, properties: T.properties, requests: requests)
        let response: WriteResponsesType = self.store.write(request: request)
        let _: [WriteResponseType] = response.responses()
    }
    
}

extension ListInteractor: ListInteractorType {
    
    func refresh() {
        self.fetch() { storables in
            self.persist(storables: storables)
        }
    }
    
    func items() -> [Listable] {
        
        let requests: [ReadRequestType] = [IndexRequest(limit: 30, offset: 0)]
        let request: ReadRequestsType = IndexRequests(model: T.model, properties: T.properties, requests: requests)
        let response: ReadResponsesType = self.store.read(request: request)
        let responses: [ReadResponseType] = response.responses()
        
        if responses.count > 0, let listables = responses[0].objects() as? [Listable] {
            return listables
        } else {
            return []
        }
    }
    
}
