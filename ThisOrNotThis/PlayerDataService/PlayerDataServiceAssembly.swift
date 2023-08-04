//
//  StorageServiceAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 20.04.2022
//	
//

import Foundation

class PlayerDataServiceAssembly: Assembly {
    func build() -> PlayerDataServiceType {
        let service = PlayerDataService()
        return service
    }
}
