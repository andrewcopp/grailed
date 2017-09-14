//
//  CreateRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct CreateRequest {
    
    let json: JSONDictionary
    
    init(json: JSONDictionary) {
        self.json = json
    }
    
}

extension CreateRequest: CreateRequestType { }
