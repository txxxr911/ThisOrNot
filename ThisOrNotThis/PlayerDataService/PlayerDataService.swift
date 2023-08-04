//
//  StorageService.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation
import RealmSwift

class PlayerDataService: PlayerDataServiceType {
    let realm = try! Realm()
    
    func all() -> [Player] {
        let players = realm.objects(PlayerRealm.self)
        return Array(players.map {Player(realmObject: $0)})
    }
    
    func add(players: [Player]) {
        try! realm.write {
            realm.add(players.map {PlayerRealm(player: $0)})
        }
    }
    
    func delete() {
        let items = realm.objects(PlayerRealm.self)
        try! realm.write {
            realm.delete(items)
        }
    }
    
    func increasePlayerScore(player: Player) {
        print("increased")
        let realmPlayer = realm.objects(PlayerRealm.self).first {$0.id == player.id}
        guard let realmPlayer = realmPlayer else {return}
        
        try? realm.write{
            realmPlayer.score = realmPlayer.score + 1
            realm.add(realmPlayer, update: .all)
        }
        
    }
    
}
