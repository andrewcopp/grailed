//
//  ListPresenter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class ListPresenter<T: Listable> {
    
    let interactor: ListInteractorType
    
    init(interactor: ListInteractorType) {
        self.interactor = interactor
    }
    
}

extension ListPresenter: ListPresenterType {
    
}
