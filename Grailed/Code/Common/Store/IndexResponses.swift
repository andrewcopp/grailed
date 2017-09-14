//
//  IndexResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct IndexResponses {
    
    let _responses: [ReadResponseType]
    
    init(responses: [ReadResponseType]) {
        self._responses = responses
    }
    
}

extension IndexResponses: ReadResponsesType {
    
    func responses() -> [ReadResponseType] {
        return self._responses
    }
    
}
