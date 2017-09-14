//
//  ReadResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct ReadResponse {
    
    let _objects: [JSONDictionary]
    
    init(objects: [JSONDictionary]) {
        self._objects = objects
    }
    
}

extension ReadResponse: ReadResponseType {
    
    func objects() -> [JSONDictionary] {
        return self._objects
    }
    
}
