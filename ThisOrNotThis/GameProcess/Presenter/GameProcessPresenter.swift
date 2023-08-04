//
//  GameProcessPresenter.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation
import SwiftUI

class GameProcessPresenter: BasePresenter<GameProcessInteractorInput, GameProcessRouterProtocol>, GameProcessModuleOutput {
    var players: [Player] {interactor.players}
    var currentLeading: Player {interactor.leadingPlayer!}
    var currentQuestion: Question {interactor.currentQuestion!}
    var playersInGame: [Player] {interactor.playersInGame}
    var selectedCell: [Bool] = []
    
    // MARK: - Weak properties
    weak var view: GameProcessViewInput?
}

// MARK: Private
extension GameProcessPresenter {
    
}

// MARK: Module Input
extension GameProcessPresenter: GameProcessModuleInput {
    
}

// MARK: View Output
extension GameProcessPresenter: GameProcessViewOutput {
    func viewDidLoad() {
        interactor.setPlayersInGame()
        interactor.loadCards()
        selectedCell = [Bool](repeating: false, count: playersInGame.count)
        view?.set(player: interactor.leadingPlayer, question: interactor.currentQuestion, round: interactor.round)
        print(currentQuestion.rufirst)
    }
    
    func didTapResultsButton() {
        interactor.endGame()
        router.showResults(players: players)
    }
    
    func didTapNextStepButton() {
        if (interactor.selectedPlayer == nil) { return // тут должен быть  алерт
            
        }
        else {
            interactor.increaseScore()
            interactor.changeLeading()
            interactor.setPlayersInGame()
            interactor.changeQuestion()
            view?.set(player: interactor.leadingPlayer, question: interactor.currentQuestion, round: interactor.round)
            unselectRows()
            view?.reloadPlayerTable()
            print(currentQuestion.rufirst)
        }
        
    }
    
    func unselectRows() {
        for i in 0...playersInGame.count - 1 {
            selectedCell[i] = false
        }
    }
    
    func didSelectedPlayer(by index: Int) {
        let player = interactor.playersInGame[index]
        interactor.setPlayer(selected: player)
        unselectRows()
        selectedCell[index] = true
        view?.reloadPlayerTable()
        
    }
    
}
