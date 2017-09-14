//
//  SearchReadResponses.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchReadResponses {
    
    let _responses: [SearchReadResponse]
    
    init(responses: [SearchReadResponse]) {
        self._responses = responses
    }
    
}

extension SearchReadResponses: ResponsesType {
 
    func responses() -> [ResponseType] {
        return self._responses
    }
    
}
