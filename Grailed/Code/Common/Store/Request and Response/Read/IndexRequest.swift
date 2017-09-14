//
//  IndexRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct IndexRequest {
    
    let limit: Int
    let offset: Int
    
    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }
    
}

extension IndexRequest: ReadRequestType {
    
    func type() -> ReadType {
        return ReadType.Index(limit: self.limit, offset: self.offset)
    }
    
}
