//
//  ListableFactoryType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/15/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

protocol ListableFactoryType {
    
    func configure(tableView: UITableView)
    
    func cell(tableView: UITableView, for indexPath: IndexPath, listable: Listable) -> UITableViewCell
    
}
