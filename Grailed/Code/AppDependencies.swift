//
//  AppDependencies.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class AppDependencies {
    
    let network: NetworkType = HTTP(host: "https://www.grailed.com/api")
    let cache: StoreType = Cache(base: SQLite())
    
}
