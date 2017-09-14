//
//  SearchResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchResponse {
    
    let _objects: [Storable]
    
    init(objects: [Storable]) {
        self._objects = objects
    }
    
}

extension SearchResponse: ReadResponseType {
    
    func objects() -> [Storable] {
        return self._objects
    }
    
}
