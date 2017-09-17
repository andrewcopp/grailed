//
//  IndexRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct IndexRequests {
    
    let _model: String
    let _properties: [String]
    let _requests: [ReadRequestType]
    
    public init(model: String, properties: [String], requests: [ReadRequestType]) {
        self._model = model
        self._properties = properties
        self._requests = requests
    }
    
}

extension IndexRequests: ReadRequestsType {
 
    public func model() -> String {
        return self._model
    }
    
    public func properties() -> [String] {
        return self._properties
    }
    
    public func requests() -> [ReadRequestType] {
        return self._requests
    }
    
}
