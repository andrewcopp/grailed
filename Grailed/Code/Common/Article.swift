//
//  Article.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

// TODO: Codeable
struct Article {
    
    let url: URL
    let title: String
    let publishedAt: Date
    
    init?(json: JSONDictionary) {
        
        guard let urlString: String = json["url"] as? String, let url: URL = URL(string: urlString) else {
            return nil
        }
        
        guard let title: String = json["title"] as? String else {
            return nil
        }
        
        guard let publishedAtString: String = json["published_at"] as? String, let publishedAt: Date = Date() else {
            return nil
        }
        
        self.url = url
        self.title = title
        self.publishedAt = publishedAt
    }
    
}

extension Article: Storable {
    
    static var model: String {
        return "articles"
    }
    
    static var properties: [String] {
        return ["url", "title", "published_at"]
    }
    
    func toJSON() -> JSONDictionary {
        let json: JSONDictionary = ["url" : self.url.absoluteString as AnyObject, "title" : self.title as AnyObject, "published_at" : self.publishedAt as AnyObject]
        return json
    }
    
}

extension Article: Listable {
    
    init(response: ResponseType) {
        self.url = URL(string: "www.google.com")!
        self.title = "This is a test."
        self.publishedAt = Date()
    }
    
}
