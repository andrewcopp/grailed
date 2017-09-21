//
//  Cache.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

public class Cache {
    
    let base: StoreType
    let cache: NSCache<NSString, AnyObject>
    
    public init(base: StoreType) {
        self.base = base
        self.cache = NSCache<NSString, AnyObject>()
    }
    
    func find(identifier: Int) -> JSONDictionary {
        return [:]
    }
    
    func index(model: String, limit: Int, offset: Int) -> [JSONDictionary] {
        let objects: [Int : Data] = self.cache.object(forKey: model as NSString) as? [Int : Data] ?? [:]
        
        let json: [JSONDictionary] = objects.flatMap() { key, value in
            let json: JSONDictionary?
            do {
                json = try JSONSerialization.jsonObject(with: value, options: []) as? JSONDictionary
            } catch {
                return nil
            }
            
            return json
        }
                
        return json
    }
    
    func search(parameters: JSONDictionary) -> [JSONDictionary] {
        return [[:]]
    }
    
    func create(model: String, object: JSONDictionary) -> Bool {
        var objects: [Int : Data] = self.cache.object(forKey: model as NSString) as? [Int : Data] ?? [Int : Data]()
        
        guard let identifier: Int = object["id"] as? Int else {
            return false
        }
        
//        if let _: Data = objects[identifier] {
//            return false
//        }
        
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

    public func read(request: ReadRequestsType) -> ReadResponsesType {
        let model: String = request.model()
        let responses: [ReadResponseType] = request.requests().map() { request in
            
            switch request.type() {
            case ReadType.Find(let identifier):
                return ReadResponse(objects: [self.find(identifier: identifier)])
            case ReadType.Index(let limit, let offset):
                return ReadResponse(objects: self.index(model: model, limit: limit, offset: offset))
            case ReadType.Search(let parameters):
                return ReadResponse(objects: self.search(parameters: parameters))
            }
            
        }
        return ReadResponses(responses: responses)
    }
    
    public func write(request: WriteRequestsType) -> WriteResponsesType {
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
