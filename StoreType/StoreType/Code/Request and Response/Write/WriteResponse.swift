//
//  WriteResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public struct WriteResponse {
    
    let _statusCode: Int
    
    public init(statusCode: Int) {
        self._statusCode = statusCode
    }
    
}

extension WriteResponse: WriteResponseType {
    
    public func statusCode() -> Int {
        return self._statusCode
    }
    
}
