//
//  PlayerData.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022.
//

import Foundation
import RealmSwift


class PlayerRealm: Object {
    
    override init() {
        super.init()
    }
    
    init(player:Player) {
        super.init()
        
        id = player.id
        playerName = player.name
        score = player.score
        sex = player.sex.rawValue
        iconName = player.image
    }
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var playerName: String = ""
    @objc dynamic var iconName: String = ""
    @objc dynamic var score = 0
    @objc dynamic var sex = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

enum Sex: Int, Codable {
    case man = 0
    case woman = 1
}


class Player: Equatable,Codable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.id == rhs.id
    }
    
    
    init() {
        
    }
    
    init(realmObject: PlayerRealm) {
        self.id = realmObject.id
        name = realmObject.playerName
        score = realmObject.score
        sex = Sex(rawValue: realmObject.sex) ?? .man
        image = realmObject.iconName
    }
    
    var id = UUID().uuidString
    var name = ""
    var score = 0
    var sex = Sex.man
    var image = ""
    

}
