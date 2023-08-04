//
//  PurchaseServiceAssembly.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation

class PurchaseServiceAssembly: Assembly {
    func build() -> PurchaseServiceType {
        let service = PurchaseService()
        return service
    }
}
