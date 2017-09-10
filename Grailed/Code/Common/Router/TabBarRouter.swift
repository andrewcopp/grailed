//
//  TabBarRouter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class TabBarRouter {
    
    let routers: [RouterType]
    
    var tabBarController: UITabBarController?
    
    init(routers: [RouterType]) {
        self.routers = routers
    }
    
}

extension TabBarRouter: RouterType {
    
    func viewController() -> UIViewController {
        if case Optional.none = self.tabBarController {
            let viewControllers: [UIViewController] = self.routers.map({ $0.viewController() })
            self.tabBarController = UITabBarController()
            self.tabBarController?.viewControllers = viewControllers
        }
        
        return self.tabBarController!
    }
    
}
