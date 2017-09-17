//
//  ReadResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct ReadResponse {
    
    let _objects: [JSONDictionary]
    
    public init(objects: [JSONDictionary]) {
        self._objects = objects
    }
    
}

extension ReadResponse: ReadResponseType {
    
    public func objects() -> [JSONDictionary] {
        return self._objects
    }
    
}
