//
//  ListFactory.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

import StoreType
import HTTP

public class ListFactory<T> where T: Storable, T: Listable {
    
    let network: AsynchronousStoreType
    let store: StoreType
    
    public init(network: AsynchronousStoreType, store: StoreType) {
        self.network = network
        self.store = store
    }
    
}

extension ListFactory: ListFactoryType {
 
    public func viewController() -> UIViewController {
        let interactor: ListInteractor = ListInteractor<T>(network: self.network, store: self.store)
        let presenter: ListPresenter = ListPresenter(interactor: interactor, factory: DefaultListableFactory())
        let viewController: ListViewController = ListViewController(presenter: presenter)
        presenter.viewController = viewController
        return viewController
    }
    
}
