//
//  FindResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct FindResponse {
    
    let _objects: [Storable]
    
    init(objects: [Storable]) {
        self._objects = objects
    }
    
}

extension FindResponse: ReadResponseType {
    
    func objects() -> [Storable] {
        return self._objects
    }
    
}
