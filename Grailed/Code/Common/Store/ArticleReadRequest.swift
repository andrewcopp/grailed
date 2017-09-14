//
//  ArticleReadRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct ArticleReadRequest {
    
    let _type: ReadType
    
    init(type: ReadType) {
        self._type = type
    }
    
}

extension ArticleReadRequest: RequestType {
    
    func type() -> ReadType {
        return self._type
    }
    
}
