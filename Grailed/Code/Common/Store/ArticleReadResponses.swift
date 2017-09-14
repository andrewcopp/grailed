//
//  ArticleReadResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct ArticleReadResponses {
    
    let _responses: [ArticleReadResponse]
    
    init(responses: [ArticleReadResponse]) {
        self._responses = responses
    }
    
}

extension ArticleReadResponses: ResponsesType {
 
    func responses() -> [ResponseType] {
        return self._responses
    }
    
}
