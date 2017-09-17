//
//  ReadType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/13/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

// TODO: Rename
public enum ReadType {
    
    case Find(identifier: Int)
    case Index(limit: Int, offset: Int)
    case Search(parameters: JSONDictionary)
    
}
