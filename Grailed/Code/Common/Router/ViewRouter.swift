//
//  ViewRouter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

class ViewRouter {
    
    let factory: FactoryType
    
    init(factory: FactoryType) {
        self.factory = factory
    }
    
}

extension ViewRouter: RouterType {
    
    func viewController() -> UIViewController {
        return self.factory.viewController()
    }
    
}
