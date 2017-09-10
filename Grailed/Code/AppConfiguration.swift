//
//  AppConfiguration.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

class AppConfiguration {
    
    let dependencies: AppDependencies
    let rootRouter: RouterType
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
        
        let articleFactory: FactoryType = ListFactory<Article>(store: dependencies.cache)
        let searchFactory: FactoryType = ListFactory<Search>(store: dependencies.cache)
        
        let articleRouter: RouterType = NavigationRouter(router: ViewRouter(factory: articleFactory))
        let searchRouter: RouterType = NavigationRouter(router: ViewRouter(factory: searchFactory))
        
        let tabBarRouter: RouterType = TabBarRouter(routers: [articleRouter, searchRouter])
        self.rootRouter = tabBarRouter
    }
    
}
