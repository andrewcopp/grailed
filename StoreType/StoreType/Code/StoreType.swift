//
//  StoreType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

public protocol StoreType {
    
    func read(request: ReadRequestsType) -> ReadResponsesType
    func write(request: WriteRequestsType) -> WriteResponsesType
    
}
