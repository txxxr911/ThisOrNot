//
//  PurchaseServiceType.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation
import StoreKit

protocol PurchaseServiceType {
    
    func isHaveActiveSubscribe() async throws -> Bool
    func restoreSubscribe() async throws
    func isPurchased(product: Product) async throws -> Bool
    func purchaseProduct(productId: String) async throws
    func fetchProducts() async throws -> [Product]
    var products: [Product] {get set}
    var purchasedIds: [String] {get set}
}
