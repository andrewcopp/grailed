//
//  FavoriteCache.swift
//  Grailed
//
//  Created by Andrew Copp on 9/21/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

class FavoriteCache {
    
}

extension FavoriteCache: StoreType {
    
    
//    return ["id", "url", "title", "published_at"]
    func read(request: ReadRequestsType) -> ReadResponsesType {
        let values: JSONDictionary = ["id" : 1 as AnyObject, "url" : "www.gralied.com" as AnyObject, "title" : "Hello, World!" as AnyObject, "published_at" : "0" as AnyObject]
        let favorite: JSONDictionary = ["values" : values as AnyObject]
        let response: ReadResponse = ReadResponse(objects: [favorite])
        let responses: ReadResponses = ReadResponses(responses: [response])
        return responses
    }
    
    func write(request: WriteRequestsType) -> WriteResponsesType {
        return WriteResponses(responses: [])
    }
    
}
