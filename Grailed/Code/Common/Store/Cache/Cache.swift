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
    let cache: NSCache<NSString, AnyObject>
    
    init(base: StoreType) {
        self.base = base
        self.cache = NSCache<NSString, AnyObject>()
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
    
    func create(model: String, object: JSONDictionary) -> Bool {
        var objects: [Int : Data] = self.cache.object(forKey: model as NSString) as? [Int : Data] ?? [Int : Data]()
        
        guard let identifier: Int = object["id"] as? Int else {
            return false
        }
        
        if let _: Data = objects[identifier] {
            return false
        }
        
        let data: Data
        do {
            data = try JSONSerialization.data(withJSONObject: object, options: [])
        } catch {
            return false
        }
        
        objects[identifier] = data
                
        self.cache.setObject(objects as AnyObject, forKey: model as NSString)
        
        return true
    }
    
    func update(model: String, object: JSONDictionary) -> Bool {
        return true
    }
    
    func delete(model: String, identifier: Int) -> Bool {
        return true
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
        let model: String = request.model()
        let responses: [WriteResponseType] = request.requests().map() { request in
            
            if let request: CreateRequestType = request as? CreateRequestType {
                if self.create(model: model, object: request.object()) {
                    return WriteResponse(statusCode: 201)
                } else {
                    return WriteResponse(statusCode: 500)
                }
            } else {
                return WriteResponse(statusCode: 500)
            }
            
        }
        return WriteResponses(responses: responses)
    }
    
}
