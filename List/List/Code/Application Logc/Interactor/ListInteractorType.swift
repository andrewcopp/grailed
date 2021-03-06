//
//  ListInteractorType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol ListInteractorType {
    
    func refresh()
    
    func model() -> String
    func items() -> [Listable]
    
}
