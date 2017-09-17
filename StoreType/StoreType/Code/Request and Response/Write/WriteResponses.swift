//
//  WriteResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct WriteResponses {
    
    let _responses: [WriteResponseType]
    
    public init(responses: [WriteResponseType]) {
        self._responses = responses
    }
    
}

extension WriteResponses: WriteResponsesType {
    
    public func responses() -> [WriteResponseType] {
        return self._responses
    }
    
}

