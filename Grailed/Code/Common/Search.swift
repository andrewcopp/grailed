//
//  Search.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct Search {
    
    let name: String
    let url: URL
    
}

extension Search: Storable {
    
    static var model: String {
        return "searches"
    }
    
    static var properties: [String] {
        return ["name", "image_url"]
    }
    
    init?(json: JSONDictionary) {
        
        guard let name: String = json["name"] as? String else {
            return nil
        }
        
        guard let urlString: String = json["image_url"] as? String, let url: URL = URL(string: urlString) else {
            return nil
        }
        
        self.name = name
        self.url = url
    }
    
    func toJSON() -> JSONDictionary {
        let json: JSONDictionary = ["name" : self.name as AnyObject, "image_url" : self.url as AnyObject]
        return json
    }
    
}

extension Search: Listable {
    
    init(response: ResponseType) {
        self.name = "This is a test."
        self.url = URL(string: "www.google.com")!
    }
    
}
