//
//  CreateRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct CreateRequests {
    
    let _model: String
    let _properties: [String]
    let _requests: [WriteRequestType]
    
    public init(model: String, properties: [String], requests: [WriteRequestType]) {
        self._model = model
        self._properties = properties
        self._requests = requests
    }
    
}

extension CreateRequests: CreateRequestsType {

    public func model() -> String {
        return self._model
    }
    
    public func properties() -> [String] {
        return self._properties
    }
    
    public func requests() -> [WriteRequestType] {
        return self._requests
    }
    
}
