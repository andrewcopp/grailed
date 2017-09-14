//
//  Cache.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class Cache {
    
    let base: StoreType
    let cache: NSCache<AnyObject, AnyObject>
    
    init(base: StoreType) {
        self.base = base
        self.cache = NSCache<AnyObject, AnyObject>()
    }
    
    func find(identifier: Int) -> AnyObject {
        return "" as AnyObject
    }
    
    func index(limit: Int, offset: Int) -> [AnyObject] {
        return ["" as AnyObject]
    }
    
    func search(parameters: JSONDictionary) -> [AnyObject] {
        return ["" as AnyObject]
    }
    
}

extension Cache: StoreType {

    func read(request: ReadRequestsType) -> ReadResponsesType {
        let responses: [ReadResponseType] = request.requests().flatMap() { request in
            guard let request: ReadRequestType = request as? ReadRequestType else {
                return nil
            }
            
            switch request.type() {
            case ReadType.Find(let identifier):
                self.find(identifier: identifier)
            case ReadType.Index(let limit, let offset):
                self.index(limit: limit, offset: offset)
            case ReadType.Search(let parameters):
                self.search(parameters: parameters)
            }
            
            return ReadResponse(objects: [])
        }
        return ReadResponses(responses: responses)
    }
    
    func write(request: WriteRequestsType) -> WriteResponsesType {
        return WriteResponses(responses: [])
    }
    
}
