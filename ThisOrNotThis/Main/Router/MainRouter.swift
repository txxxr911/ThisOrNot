//
//  MainRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class MainRouter: BaseModuleRouter, MainRouterProtocol {
    
    func showGameStartView() {
        let module = self.container.resolve(StartGameAssembly.self).build(coordinator: self.coordinator)
        coordinator.router.push(module)
    }
    
    func showCatalogView() {
        let module = self.container.resolve(CatalogAssembly.self).build(coordinator: self.coordinator).with(deepLink: .fromMain)
        coordinator.router.push(module)
    }
    
    func showRulesView() {
        let module = self.container.resolve(RulesAssembly.self).build(coordinator: self.coordinator)
        coordinator.router.push(module)
    }
}
