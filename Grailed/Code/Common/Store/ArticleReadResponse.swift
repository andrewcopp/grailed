//
//  ArticleReadResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct ArticleReadResponse {
    
    let articles: [Article]
    
    init(articles: [Article]) {
        self.articles = articles
    }
    
}

extension ArticleReadResponse: ResponseType {
    
}
