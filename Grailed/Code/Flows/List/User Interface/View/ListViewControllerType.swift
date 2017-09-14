//
//  ListViewControllerType.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

protocol ListViewControllerType: ViewControllerType {
    
    func tableView() -> UITableView
    
}
