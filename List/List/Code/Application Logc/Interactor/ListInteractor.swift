//
//  ListInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType
import HTTP

class ListInteractor<T> where T: Storable, T: Listable {
    
    let network: AsynchronousStoreType
    let store: StoreType
        
    init(network: AsynchronousStoreType, store: StoreType) {
        self.network = network
        self.store = store
    }
    
}

extension ListInteractor: ListInteractorType {
    
    func model() -> String {
        return T.model
    }
    
    func refresh() {
        let requests: [ReadRequestType] = [IndexRequest(limit: 30, offset: 0)]
        let request: ReadRequestsType = IndexRequests(model: T.model, properties: T.properties, requests: requests)
        self.network.read(requests: request) { response in
            let responses: [ReadResponseType] = response.responses()
            if responses.count > 0 {
                // TODO: Don't Hide Serialization Error
                let objects = responses[0].objects().flatMap({ T(json: $0) })
                
                let requests: [WriteRequestType] = objects.map({ CreateRequest(object: $0.toJSON()) })
                let request: WriteRequestsType = CreateRequests(model: T.model, properties: T.properties, requests: requests)
                let response: WriteResponsesType = self.store.write(request: request)
                let _: [WriteResponseType] = response.responses()
                
                let notification: Notification = Notification.init(name: Notification.Name(rawValue: "ApplicationDidRefreshStorables"))
                NotificationCenter.default.post(notification)
            }
        }
    }
    
    func items() -> [Listable] {
        
        let requests: [ReadRequestType] = [IndexRequest(limit: 0, offset: 0)]
        let request: ReadRequestsType = IndexRequests(model: T.model, properties: T.properties, requests: requests)
        let response: ReadResponsesType = self.store.read(request: request)
        let responses: [ReadResponseType] = response.responses()
        
        if responses.count > 0, let listables = responses[0].objects().map({ T(json: $0) }) as? [Listable] {
            return listables
        } else {
            return []
        }
    }
    
}
