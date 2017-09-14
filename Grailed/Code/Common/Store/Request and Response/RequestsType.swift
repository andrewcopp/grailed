//
//  RequestsType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol RequestsType {
    
    static var method: Method { get }
    
    func model() -> String
    
    // TODO: Generic
//    func requests() -> [RequestType]
    
}
