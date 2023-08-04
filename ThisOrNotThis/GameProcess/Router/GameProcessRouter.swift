//
//  GameProcessRouter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class GameProcessRouter: BaseModuleRouter, GameProcessRouterProtocol {
    
    func showResults(players: [Player]) {
        let module = self.container.resolve(ResultsAssembly.self).build(players: players, coordinator: coordinator)
        print("AAA   \(players[0].score)")
        coordinator.router.push(module)
    }
    
    
}
