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
    
    init(interactor: ListInteractorType) {
        self.interactor = interactor
        
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
    
    func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
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
        print(self.interactor.items().count)
        return self.interactor.items().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Andrew Copp"
        return cell
    }
    
}

extension ListPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
