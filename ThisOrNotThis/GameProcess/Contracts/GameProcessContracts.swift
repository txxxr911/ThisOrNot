//
//  GameProcessContracts.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

// Module Input
protocol GameProcessModuleInput {
    
}

// Module Output
protocol GameProcessModuleOutput {
    
}

// View Input
protocol GameProcessViewInput: AnyObject {
    func reloadPlayerTable()
    func set(player: Player?, question: Question?, round: Int)
}

// View Output
protocol GameProcessViewOutput: AnyObject {
    func viewDidLoad()
    var selectedCell: [Bool] {get set}
    var players: [Player] { get }
    var playersInGame: [Player] { get }
    var currentLeading: Player {get}
    var currentQuestion: Question {get}
    func didSelectedPlayer(by index: Int)
    func didTapResultsButton()
    func didTapNextStepButton()
}

// Interactor
protocol GameProcessInteractorInput {
    var players: [Player] {get set}
    var items: [Question] {get set}
    var currentQuestion: Question? {get set}
    var selectedPlayer: Player? {get}
    var leadingPlayer: Player? {get set}
    var playersInGame: [Player] {get set}
    var round: Int {get set}
    func changeLeading()
    func increaseScore()
    func setPlayersInGame()
    func changeQuestion()
    func loadCards()
    func endGame()
    func setPlayer(selected player: Player)
}

// Router
protocol GameProcessRouterProtocol: AlertRoutable {
    func showResults(players: [Player])
}
