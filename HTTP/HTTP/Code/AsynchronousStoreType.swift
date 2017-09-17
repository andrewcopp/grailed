//
//  AsynchronousStoreType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/13/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

public protocol AsynchronousStoreType {
    
    func read(requests: ReadRequestsType, completion: @escaping (ReadResponsesType) -> ())
    func write(requests: WriteRequestsType, completion: @escaping (WriteResponsesType) -> ())
    
}
