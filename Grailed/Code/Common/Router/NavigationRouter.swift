//
//  NavigationRouter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class NavigationRouter {
    
    let router: RouterType
    
    var navigationController: UINavigationController?
    
    init(router: RouterType) {
        self.router = router
    }
    
}

extension NavigationRouter: RouterType {
    
    func viewController() -> UIViewController {
        if case Optional.none = self.navigationController {
            let viewController: UIViewController = self.router.viewController()
            self.navigationController = UINavigationController(rootViewController: viewController)
        }
        
        return self.navigationController!
    }
    
}
