//
//  GameProcessInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class GameProcessInteractor: GameProcessInteractorInput {
    
    var players: [Player]
    var items: [Question] = []
    
    let questionDataService: QuestionDataServiceType
    let playersDataService: PlayerDataServiceType
    var round = 1
    
    var leadingPlayer: Player?
    var playersInGame: [Player]
    var includedSets: [Kit]
    var currentQuestion: Question? = Question()
    private(set) var selectedPlayer: Player?
    
    
    init(players: [Player], includedSets: [Kit], playersInGame: [Player], leadingPlayer: Player, questionDataService: QuestionDataServiceType, playersDataService: PlayerDataServiceType) {
        self.players = players
        self.includedSets = includedSets
        self.playersDataService = playersDataService
        self.questionDataService = questionDataService
        self.leadingPlayer = leadingPlayer
        self.playersInGame = playersInGame
        for item in includedSets {
            print("\(item.id)")
        }
    }
    
    func increaseScore() {
        guard let player = selectedPlayer else { return }
        
        playersDataService.increasePlayerScore(player: player)
        
        
    }
    
    func endGame() {
        players.removeAll()
        players.append(contentsOf: playersDataService.all())
    }
    
    func changeQuestion() {
        guard let question = currentQuestion else {return}
        
        questionDataService.save(question: question)
        
        self.currentQuestion = items[round - 1]
        
        
    }
    
    func changeLeading() {
        guard let player = leadingPlayer else { return }
        guard let currentPlayerIndex = players.firstIndex(of: player) else { return }
        
        if players.count - 1 == currentPlayerIndex {
            self.leadingPlayer = players[0]
        }
        else {
            self.leadingPlayer = players[currentPlayerIndex + 1]
        }
        round += 1
    }
    
    func setPlayersInGame() {
        playersInGame = players.filter { $0.id != leadingPlayer?.id }
    }
    
    func setPlayer(selected player: Player) {
        selectedPlayer = player
        print("selected \(player.name)")
    }
    
    func loadCards() {
        for kit in includedSets {
            switch kit.id {
                
            case "com.artemtishchenko.thisorthat.demo":
                self.items = self.items + questionDataService.getAll(setName: "demo")
                
            case "com.artemtishchenko.thisorthat.cinema":
                self.items = self.items + questionDataService.getAll(setName: "cinema")
                
            case "com.artemtishchenko.thisorthat.xxx":
                self.items = self.items + questionDataService.getAll(setName: "adult")
                
            case "com.artemtishchenko.thisorthat.school":
                self.items = self.items + questionDataService.getAll(setName: "school")
                
            default:
                return
            }
        }
        self.items.shuffle()
        currentQuestion = items[0]
    }
    
    func setQuestion() {
        
    }
}

// MARK: Private
extension GameProcessInteractor {
    
}
