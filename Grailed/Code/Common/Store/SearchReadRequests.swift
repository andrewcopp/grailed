//
//  SearchReadRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchReadRequests {
    
    let _requests: [SearchReadRequest]
    
    init(requests: [SearchReadRequest]) {
        self._requests = requests
    }
    
}

extension SearchReadRequests: ReadRequestsType {
    
    static var model: String {
        return "searches"
    }
    
    static var properties: [String] {
        return ["name", "url"]
    }
    
    func requests() -> [RequestType] {
        return self._requests
    }
    
}
