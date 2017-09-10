//
//  ListInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class ListInteractor<T: Listable> {
    
    let dataManager: ListDataManagerType
    
    init(dataManager: ListDataManagerType) {
        self.dataManager = dataManager
    }
    
}

extension ListInteractor: ListInteractorType {
    
}
