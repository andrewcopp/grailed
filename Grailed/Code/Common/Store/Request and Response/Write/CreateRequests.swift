//
//  CreateRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct CreateRequests {
    
    let requests: [CreateRequestType]
    
    init(requests: [CreateRequestType]) {
        self.requests = requests
    }
    
}

extension CreateRequests: CreateRequestsType { }
