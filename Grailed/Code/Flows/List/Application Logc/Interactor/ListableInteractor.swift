//
//  ListableInteractor.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class ListableInteractor {
    
    let _listable: Listable
    
    init(listable: Listable) {
        self._listable = listable
    }
    
}

extension ListableInteractor: ListableInteractorType {
    
    func listable() -> Listable {
        return self._listable
    }
    
}
