//
//  StartGameAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias StartGameModule = Module<StartGameModuleInput, StartGameModuleOutput>

class StartGameAssembly: Assembly {
    func build(coordinator: CoordinatorType) -> StartGameModule {
        // View
        let view = StartGameViewController.controllerFromStoryboard("StartGame")
        
        // Services
        let playerDataService = container.resolve(PlayerDataServiceAssembly.self).build()
        
        // Interactor
        let interactor = StartGameInteractor(playerDataService: playerDataService)
        
        // Router
        let router = StartGameRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = StartGamePresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
