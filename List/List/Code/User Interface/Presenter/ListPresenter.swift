//
//  ListPresenter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter: NSObject {
    
    weak var viewController: ListViewControllerType?
    let interactor: ListInteractorType
    let factory: ListableFactoryType
    
    init(interactor: ListInteractorType, factory: ListableFactoryType) {
        self.interactor = interactor
        self.factory = factory
        
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ListPresenter.applicationDidRefreshStoreables(notifcation:)), name: Notification.Name.init(rawValue: "ApplicationDidRefreshStorables"), object: nil)
    }
    
    dynamic func applicationDidRefreshStoreables(notifcation: Notification) {
        DispatchQueue.main.async {
            self.viewController?.tableView().reloadData()
        }
    }
    
}

extension ListPresenter: ListPresenterType {
    
    func name() -> String {
        let name: String = self.interactor.model()
        return name.capitalized
    }
    
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        self.factory.configure(tableView: tableView)
    }
    
    func refresh() {
        DispatchQueue.global(qos: DispatchQoS.background.qosClass).async {
            self.interactor.refresh()
        }
    }
    
}


extension ListPresenter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor.items().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.factory.cell(tableView: tableView, for: indexPath, listable: self.interactor.items()[indexPath.row])
    }
    
}

extension ListPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
