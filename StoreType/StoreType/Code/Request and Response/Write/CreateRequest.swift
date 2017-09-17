//
//  CreateRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct CreateRequest {
    
    let _object: JSONDictionary
    
    public init(object: JSONDictionary) {
        self._object = object
    }
    
}

extension CreateRequest: CreateRequestType {

    public func object() -> JSONDictionary {
        return self._object
    }
    
}
