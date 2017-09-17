//
//  ReadRequestsType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/13/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public protocol ReadRequestsType: RequestsType {

    func properties() -> [String]
    func requests() -> [ReadRequestType]
    
}

extension ReadRequestsType {
    
    public static var method: Method {
        return Method.read
    }
    
}
