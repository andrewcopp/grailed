//
//  ReadRequestsType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/13/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol ReadRequestsType: RequestsType {

    static var properties: [String] { get }
    
}

extension ReadRequestsType {
    
    static var method: Method {
        return Method.read
    }
    
}
