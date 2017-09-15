//
//  WriteResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct WriteResponse {
    
    let _statusCode: Int
    
    init(statusCode: Int) {
        self._statusCode = statusCode
    }
    
}

extension WriteResponse: WriteResponseType {
    
    func statusCode() -> Int {
        return self._statusCode
    }
    
}
