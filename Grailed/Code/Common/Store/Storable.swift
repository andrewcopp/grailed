//
//  Storable.swift
//  Grailed
//
//  Created by Andrew Copp on 9/14/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol Storable {
    
    static var model: String { get }
    static var properties: [String] { get }
    
    func toJSON() -> JSONDictionary

}
