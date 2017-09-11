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
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        let options: NSLayoutFormatOptions = []
        let metrics: [String : Any]? = nil
        let views: [String : Any] = ["tableView" : self.tableView]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: options, metrics: metrics, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: options, metrics: metrics, views: views))
        
        self.tableView.dataSource = self.presenter
        self.tableView.delegate = self.presenter
    }
    
}

extension ListViewController: ListViewControllerType {
    
}
