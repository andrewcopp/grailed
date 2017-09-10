//
//  ListFactory.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class ListFactory<T: Listable> {
    
    let store: StoreType
    
    init(store: StoreType) {
        self.store = store
    }
    
}

extension ListFactory: ListFactoryType {
 
    func viewController() -> UIViewController {
        let dataManager: ListDataManagerType = ListDataManager()
        let interactor: ListInteractorType = ListInteractor<T>(dataManager: dataManager)
        let presenter: ListPresenterType = ListPresenter<T>(interactor: interactor)
        return ListViewController(presenter: presenter)
    }
    
}
