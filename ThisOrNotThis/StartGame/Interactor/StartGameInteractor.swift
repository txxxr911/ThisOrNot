//
//  StartGameInteractor.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class StartGameInteractor: StartGameInteractorInput {

    let playerDataService: PlayerDataServiceType
    var players: [Player] = []
    
    init (playerDataService: PlayerDataServiceType) {
        self.playerDataService = playerDataService
        players.append(contentsOf: playerDataService.all())
    }

    func addPlayer() {
        let player = Player()
        player.image = playerImage(player: player)
        players.append(player)
    }
    
    func removePlayer(player: Player) {
        players.removeObject(player)
    }
    
    func changeSex(player: Player) {
        if (player.sex == .man) {player.sex = .woman} else {player.sex = .man}
    }
    
    func save() {
        playerDataService.delete()
        playerDataService.add(players: players)
    }
    
    fileprivate func playerImage(player: Player) -> String {
        let number = Int.random(in: 1...10)
        return "team_image_\(number)"
    }
    
}

// MARK: Private
extension StartGameInteractor {
    
}
