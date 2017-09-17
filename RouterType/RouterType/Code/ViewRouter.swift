//
//  ViewRouter.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation
import UIKit

import FactoryType

public class ViewRouter {
    
    let factory: FactoryType
    
    public init(factory: FactoryType) {
        self.factory = factory
    }
    
}

extension ViewRouter: RouterType {
    
    public func viewController() -> UIViewController {
        return self.factory.viewController()
    }
    
}
