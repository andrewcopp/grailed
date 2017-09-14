//
//  SQLite.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class SQLite {
    
}

extension SQLite: StoreType {
    
    func read(request: ReadRequestsType) -> ReadResponsesType {
        return FindResponses(responses: [])
    }
    
    func write(request: RequestsType) -> ResponsesType {
        return CreateResponses(responses: [])
    }
    
}
