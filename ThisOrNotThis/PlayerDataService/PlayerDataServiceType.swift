//
//  StorageServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation

protocol PlayerDataServiceType {
    
    func all() -> [Player]
    func add(players:[Player])
    func delete()
    func increasePlayerScore(player: Player)

}
