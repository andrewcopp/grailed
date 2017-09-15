//
//  Search.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct Search {
    
    let identifier: Int
    let name: String
    let url: URL
    
}

extension Search: Storable {
    
    static var model: String {
        return "searches"
    }
    
    static var properties: [String] {
        return ["id", "name", "image_url"]
    }
    
    init?(json: JSONDictionary) {
        
        guard let identifier: Int = json["id"] as? Int else {
            return nil
        }
        
        guard let name: String = json["name"] as? String else {
            return nil
        }
        
        guard let urlString: String = json["image_url"] as? String, let url: URL = URL(string: urlString) else {
            return nil
        }
        
        self.identifier = identifier
        self.name = name
        self.url = url
    }
    
    func toJSON() -> JSONDictionary {
        let json: JSONDictionary = [
            "id" : self.identifier as AnyObject,
            "name" : self.name as AnyObject,
            "image_url" : self.url.absoluteString as AnyObject
        ]
        return json
    }
    
}

extension Search: Listable {
    
    init(response: ResponseType) {
        self.identifier = 1
        self.name = "This is a test."
        self.url = URL(string: "www.google.com")!
    }
    
}
