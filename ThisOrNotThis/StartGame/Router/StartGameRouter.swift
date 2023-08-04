//
//  StartGameRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGameRouter: BaseModuleRouter, StartGameRouterProtocol {
    func navigateBack() {
        coordinator.router.popModule()
    }
    
    
    func navigateToCatalog(players: [Player]) {
        let module = container.resolve(CatalogAssembly.self).build(coordinator: coordinator).with(players: players).with(deepLink: .fromStartGame)
        coordinator.router.push(module)
    }
    
    func navigateToMain() {
        let module = container.resolve(MainAssembly.self).build(coordinator: coordinator)
        coordinator.router.setRootModule(module, hideBar: true)
    }
    
    
    
    
}
