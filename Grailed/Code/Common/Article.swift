//
//  Article.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

struct Article {
    
    let url: URL
    let title: String
    let publishedAt: Date
    
}

extension Article: Listable {
    
}
