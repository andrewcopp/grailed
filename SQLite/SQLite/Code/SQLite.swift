//
//  SQLite.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType

public class SQLite {
    
    public init() {
        
    }
    
}

extension SQLite: StoreType {
    
    public func read(request: ReadRequestsType) -> ReadResponsesType {
        return ReadResponses(responses: [])
    }
    
    public func write(request: WriteRequestsType) -> WriteResponsesType {
        return WriteResponses(responses: [])
    }
    
}
