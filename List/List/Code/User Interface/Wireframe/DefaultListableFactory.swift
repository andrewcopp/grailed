//
//  DefaultListableFactory.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

import StoreType

class DefaultListableFactory {
    
    let store: StoreType
    
    init(store: StoreType) {
        self.store = store
    }
    
}

extension DefaultListableFactory: ListableFactoryType {
    
    func configure(tableView: UITableView) {
        tableView.register(DefaultListableCell.self, forCellReuseIdentifier: "DefaultListableCell")
    }
    
    func cell(tableView: UITableView, for indexPath: IndexPath, listable: Listable) -> UITableViewCell {
        let interactor: ListableInteractorType = ListableInteractor(listable: listable, store: self.store)
        let presenter: DefaultListablePresenter = DefaultListablePresenter(interactor: interactor)
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DefaultListableCell", for: indexPath)
        if let listableCell: DefaultListableCellType = cell as? DefaultListableCellType {
            listableCell.set(presenter: presenter)
            presenter.cell = listableCell
            listableCell.hydrate()
        }
        return cell
    }
    
}
