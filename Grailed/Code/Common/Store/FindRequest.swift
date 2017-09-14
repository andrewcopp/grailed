//
//  FindRequest.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct FindRequest {
    
    let identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}

extension FindRequest: ReadRequestType {
    
    func type() -> ReadType {
        return ReadType.Find(identifier: identifier)
    }
    
}
