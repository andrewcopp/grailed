//
//  WriteResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct WriteResponses {
    
    let _responses: [WriteResponseType]
    
    init(responses: [WriteResponseType]) {
        self._responses = responses
    }
    
}

extension WriteResponses: WriteResponsesType {
    
    func responses() -> [WriteResponseType] {
        return self._responses
    }
    
}

