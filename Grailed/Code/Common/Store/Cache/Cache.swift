//
//  Cache.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class Cache {
    
    let base: StoreType
    
    init(base: StoreType) {
        self.base = base
    }
    
    
}

extension Cache: StoreType {

    func execute(requests: RequestsType) -> ResponsesType {
        return ArticleReadResponses(responses: [])
    }
    
}
