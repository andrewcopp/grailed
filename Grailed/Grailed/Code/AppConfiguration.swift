//
//  AppConfiguration.swift
//  Grailed
//
//  Created by Andrew Copp on 9/10/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import Foundation

import FactoryType
import RouterType
import Navigation
import TabBar
import List

class AppConfiguration {
    
    let dependencies: AppDependencies
    let rootRouter: RouterType
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
        
        let articleFactory: FactoryType = ListFactory<Article>(network: self.dependencies.network, store: self.dependencies.cache)
        let searchFactory: FactoryType = ListFactory<Search>(network: self.dependencies.network, store: self.dependencies.cache)
        let favoriteFactory: FactoryType = ListFactory<Favorite>(network: self.dependencies.network, store: self.dependencies.mockCache)
        
        let articleRouter: RouterType = NavigationRouter(router: ViewRouter(factory: articleFactory))
        let searchRouter: RouterType = NavigationRouter(router: ViewRouter(factory: searchFactory))
        let favoriteRouter: RouterType = NavigationRouter(router: ViewRouter(factory: favoriteFactory))
        
        let tabBarRouter: RouterType = TabBarRouter(routers: [articleRouter, searchRouter, favoriteRouter])
        self.rootRouter = tabBarRouter
    }
    
}
