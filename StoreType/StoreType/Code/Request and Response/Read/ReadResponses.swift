//
//  ReadResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct ReadResponses {
    
    let _responses: [ReadResponseType]
    
    public init(responses: [ReadResponseType]) {
        self._responses = responses
    }
    
}

extension ReadResponses: ReadResponsesType {
    
    public func responses() -> [ReadResponseType] {
        return self._responses
    }
    
}
