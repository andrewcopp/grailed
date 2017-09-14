//
//  SearchReadResponse.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct SearchReadResponse {
    
    let searches: [Search]
    
    init(searches: [Search]) {
        self.searches = searches
    }
    
}

extension SearchReadResponse: ResponseType {
    
}
