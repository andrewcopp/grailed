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
        let responses: [ReadResponseType] = request.requests().map() { request in
            
//            switch request.type() {
//            case ReadType.Find(let identifier):
//                return ReadResponse(objects: [self.find(identifier: identifier) as! Dictionary<String, AnyObject>])
//            case ReadType.Index(let limit, let offset):
//                return ReadResponse(objects: self.index(limit: limit, offset: offset) as! [Dictionary<String, AnyObject>])
//            case ReadType.Search(let parameters):
//                return ReadResponse(objects: self.search(parameters: parameters) as! [Dictionary<String, AnyObject>])
//            }
            
            return ReadResponse(objects: [[:]])
            
        }
        return ReadResponses(responses: responses)
    }
    
    func write(request: WriteRequestsType) -> WriteResponsesType {
        let responses: [WriteResponseType] = request.requests().map() { request in
            return WriteResponse()
        }
        return WriteResponses(responses: responses)
    }
    
}
