//
//  ListViewController.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
 
    let presenter: ListPresenterType
    
    let tableView: UITableView = UITableView()
    
    init(presenter: ListPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ListViewController.applicationDidBecomeActive(notificaiton:)), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        let options: NSLayoutFormatOptions = []
        let metrics: [String : Any]? = nil
        let views: [String : Any] = ["tableView" : self.tableView]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: options, metrics: metrics, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: options, metrics: metrics, views: views))
        
        self.presenter.configure(tableView: self.tableView)
        self.presenter.refresh()
    }
    
    dynamic func applicationDidBecomeActive(notificaiton: Notification) {
        self.presenter.refresh()
    }
    
}

extension ListViewController: ListViewControllerType {
    
}
