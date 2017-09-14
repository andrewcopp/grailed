//
//  Search.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct Search {
    
    let name: String
    let url: URL
    
}

extension Search: Listable {
    
    init(response: ResponseType) {
        self.name = "This is a test."
        self.url = URL(string: "www.google.com")!
    }
    
}
