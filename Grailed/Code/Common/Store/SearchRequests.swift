//
//  SearchRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchRequests {
    
    let _model: String
    let _properties: [String]
    let _requests: [ReadRequestType]
    
    init(model: String, properties: [String], requests: [ReadRequestType]) {
        self._model = model
        self._properties = properties
        self._requests = requests
    }
    
}

extension SearchRequests: ReadRequestsType {
    
    func model() -> String {
        return self._model
    }
    
    func properties() -> [String] {
        return self._properties
    }
    
    func requests() -> [ReadRequestType] {
        return self._requests
    }
    
}
