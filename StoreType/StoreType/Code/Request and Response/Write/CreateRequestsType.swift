//
//  CreateRequestsType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public protocol CreateRequestsType: WriteRequestsType {

    func properties() -> [String]
    
}

extension CreateRequestsType {
    
    public static var method: Method {
        return Method.create
    }
    
}
