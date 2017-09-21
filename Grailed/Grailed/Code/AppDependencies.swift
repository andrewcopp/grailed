//
//  AppDependencies.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import StoreType
import HTTP
import Cache
import SQLite

class AppDependencies {
    
    let network: AsynchronousStoreType = HTTP(host: "https://www.grailed.com/api")
    let cache: StoreType = Cache(base: SQLite())
    let mockCache: StoreType = FavoriteCache()
    
}
