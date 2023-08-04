//
//  StartGameContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation
import UIKit

// Module Input
protocol StartGameModuleInput {
    
}

// Module Output
protocol StartGameModuleOutput {
    
}

// View Input
protocol StartGameViewInput: class {
    func set(title: String)
    func showAlert(alert: UIAlertController)
}

// View Output
protocol StartGameViewOutput: class {
    func viewDidLoad()
    var players: [Player] { get }
    func addPlayer()
    func didRemoveItem(player: Player)
    func changeSexButtonDidTap(player: Player)
    func startButtonPressed()
    func didTapBackButton()
}

// Interactor
protocol StartGameInteractorInput {
    var players: [Player] { get }
    func addPlayer()
    func removePlayer(player: Player)
    func changeSex(player: Player)
    func save()
}

// Router
protocol StartGameRouterProtocol: AlertRoutable {
 
    func navigateBack()
    func navigateToCatalog(players: [Player])
    func navigateToMain()

}
