//
//  Network.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class Network {
    
    let urlSession: URLSession
    
    init() {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: configuration)
    }
    
}

extension Network: StoreType {
    
}

