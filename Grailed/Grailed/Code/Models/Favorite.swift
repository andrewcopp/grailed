//
//  Favorite.swift
//  Grailed
//
//  Created by Andrew Copp on 9/21/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType
import List

enum Favorite {
    case A(article: Article)
    case S(search: Search)
}

extension Favorite: Listable {
    
    func primaryText() -> String {
        switch self {
        case Favorite.A(let article):
            return article.primaryText()
        case Favorite.S(let search):
            return search.primaryText()
        }
    }
    
    func secondaryText() -> String {
        switch self {
        case Favorite.A(let article):
            return article.secondaryText()
        case Favorite.S(let search):
            return search.secondaryText()
        }
    }
    
}

extension Favorite: Storable {
    
    static var model: String {
        return "favorites"
    }
    
    static var properties: [String] {
        return ["values"]
    }
    
    init?(json: JSONDictionary) {
        guard let values: JSONDictionary = json["values"] as? JSONDictionary else {
            return nil
        }
        
        if let article: Article = Article(json: values) {
            self = Favorite.A(article: article)
        } else if let search: Search = Search(json: values) {
            self = Favorite.S(search: search)
        } else {
            return nil
        }
    }
    
    func toJSON() -> JSONDictionary {
        switch self {
        case Favorite.A(let article):
            return ["values" : article.toJSON() as AnyObject]
        case Favorite.S(let search):
            return ["values" : search.toJSON() as AnyObject]
        }
    }
    
}

