//
//  SearchRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchRequest {
    
    let parameters: JSONDictionary
    
    init(parameters: JSONDictionary) {
        self.parameters = parameters
    }
    
}

extension SearchRequest: ReadRequestType {
    
    func type() -> ReadType {
        return ReadType.Search(parameters: self.parameters)
    }
    
}
