//
//  CreateResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct CreateResponses {
    
    let _responses: [ResponseType]
    
    init(responses: [ResponseType]) {
        self._responses = responses
    }
    
}

extension CreateResponses: ResponsesType {
    
    func responses() -> [ResponseType] {
        return self._responses
    }
    
}
