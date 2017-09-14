//
//  ListInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class ListInteractor<T: Listable> {
    
    let network: NetworkType
    let store: StoreType
    
    init(network: NetworkType, store: StoreType) {
        self.network = network
        self.store = store
    }
    
    func fetch(completion: ([T]) -> ()) {
//        let requests: [ArticleReadRequest] = [ArticleReadRequest()]
//        let request: ArticleReadRequests = ArticleReadRequests(requests: requests)
//        self.network.execute(requests: request) { response in
//            let listables: [T] = response.responses().map() { response in
//                return Article(url: URL(string: "www.google.com")!, title: "This is a test", publishedAt: Date())
//            }
//            completion(listables)
//        }
    }
    
    func persist(listables: [T]) {
        
    }
    
}

extension ListInteractor: ListInteractorType {
    
    func refresh() {
        self.fetch() { listables in
            self.persist(listables: listables)
        }
    }
    
    func items() -> [Listable] {
        let requests: [ArticleReadRequest] = [ArticleReadRequest(type: ReadType.Index(limit: 30, offset: 0))]
        let request: ArticleReadRequests = ArticleReadRequests(requests: requests)
        guard let response: ArticleReadResponses = self.store.execute(requests: request) as? ArticleReadResponses else {
            return []
        }
        
        let articles: [Article] = response.responses().map() { response in
            return Article(url: URL(string: "www.google.com")!, title: "This is a test", publishedAt: Date())
        }
        
        return articles
    }
    
}
