//
//  GameProcessAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

typealias GameProcessModule = Module<GameProcessModuleInput, GameProcessModuleOutput>

class GameProcessAssembly: Assembly {
    func build(players: [Player], kits: [Kit], coordinator: CoordinatorType) -> GameProcessModule {
        // View
        let view = GameProcessViewController.controllerFromStoryboard("GameProcess")
        
        // Services
        let questionDataService = container.resolve(QuestionDataServiceAssembly.self).build()
        let playerDataService = container.resolve(PlayerDataServiceAssembly.self).build()
        
        // Interactor
        let interactor = GameProcessInteractor(players: players, includedSets: kits, playersInGame: players, leadingPlayer: players[0], questionDataService: questionDataService, playersDataService: playerDataService)
        
        // Router
        let router = GameProcessRouter(coordinator: coordinator)
        
        // Presenter
        let presenter = GameProcessPresenter(interactor: interactor, router: router)
        
        // Dependency Setup
        presenter.view = view
        view.output = presenter
        
        return Module(view: view, input: presenter, output: presenter)
    }
}
