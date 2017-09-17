//
//  ListableCellType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

protocol ListableCellType: class {
    
    func set(presenter: ListablePresenterType)
    func hydrate()
    
}
