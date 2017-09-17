//
//  Article.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType
import List

// TODO: Codeable
struct Article {
    
    let identifier: Int
    let url: URL
    let title: String
    let publishedAt: Date
    
}

extension Article: Storable {
    
    static var model: String {
        return "articles"
    }
    
    static var properties: [String] {
        return ["id", "url", "title", "published_at"]
    }
    
    init?(json: JSONDictionary) {
        
        guard let identifier: Int = json["id"] as? Int else {
            return nil
        }
        
        guard let urlString: String = json["url"] as? String, let url: URL = URL(string: urlString) else {
            return nil
        }
        
        guard let title: String = json["title"] as? String else {
            return nil
        }
        
        guard let publishedAtString: String = json["published_at"] as? String, let publishedAt: Date = Date() else {
            return nil
        }
        
        self.identifier = identifier
        self.url = url
        self.title = title
        self.publishedAt = publishedAt
    }
    
    func toJSON() -> JSONDictionary {
        let json: JSONDictionary = [
            "id" : self.identifier as AnyObject,
            "url" : self.url.absoluteString as AnyObject,
            "title" : self.title as AnyObject,
            "published_at" : "TODO: Date" as AnyObject
        ]
        return json
    }
    
}

extension Article: Listable {
    
    func primaryText() -> String {
        return self.title
    }
    
    func secondaryText() -> String {
        return "\(self.publishedAt)"
    }
    
}
