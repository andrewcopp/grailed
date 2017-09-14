//
//  ArticleReadRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct ArticleReadRequests {
    
    let _requests: [ArticleReadRequest]
    
    init(requests: [ArticleReadRequest]) {
        self._requests = requests
    }
    
}

extension ArticleReadRequests: ReadRequestsType {
 
    static var model: String {
        return "articles"
    }
    
    static var properties: [String] {
        return ["url", "title", "published_at"]
    }
    
    func requests() -> [RequestType] {
        return self._requests
    }
    
}
