//
//  ListFactory.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class ListFactory<T> where T: Storable, T: Listable {
    
    let network: NetworkType
    let store: StoreType
    
    init(network: NetworkType, store: StoreType) {
        self.network = network
        self.store = store
    }
    
}

extension ListFactory: ListFactoryType {
 
    func viewController() -> UIViewController {
        let interactor: ListInteractorType = ListInteractor<T>(network: self.network, store: self.store)
        let presenter: ListPresenterType = ListPresenter(interactor: interactor)
        return ListViewController(presenter: presenter)
    }
    
}
