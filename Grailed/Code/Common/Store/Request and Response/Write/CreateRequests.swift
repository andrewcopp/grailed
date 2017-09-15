//
//  CreateRequests.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct CreateRequests {
    
    let _requests: [WriteRequestType]
    
    init(requests: [WriteRequestType]) {
        self._requests = requests
    }
    
}
extension CreateRequests: CreateRequestsType {

    func requests() -> [WriteRequestType] {
        return self._requests
    }
    
}
