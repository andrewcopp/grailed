//
//  WriteRequestsType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public protocol WriteRequestsType: RequestsType {

    func requests() -> [WriteRequestType]
    
}
