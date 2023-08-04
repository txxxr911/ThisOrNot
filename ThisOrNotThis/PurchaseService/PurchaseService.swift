//
//  PurchaseService.swift
//  ThisOrThat
//
//  Created by Victor on 16.05.2022
//	
//

import Foundation
import StoreKit

class PurchaseService: NSObject, ObservableObject, PurchaseServiceType {
  
    
    var productIDs: Set<String> = ["com.************.************.cinema", "com.************.************.xxx", "com.************.************.school", "com.************.************.yearsubscription", "com.************.************.weeksubscription", "com.************.************.foreversubscription"]
    
        internal var products: [Product] = []
        internal var purchasedIds: [String] = []
    
    
    override init() {
        super.init()
    }
    
    func fetchProducts() async throws -> [Product] {
        do {
            let products = try await Product.products(for: productIDs)
            
            DispatchQueue.main.sync {
                self.products = products
            }
            for item in self.products {
                if (try await isPurchased(product: item)) {
                    purchasedIds.append(item.id)
                }
                else {
                }
            }
        }
                
        catch {
            print("Failed product fetch: \(error)")
        }
        return products
    }
    
    
    
    func purchaseProduct(productId: String) async throws {
        let product = products.first {$0.id == productId}
        
        do {
            let result = try await product?.purchase()
            
            switch result {
            case .success(let verification):
                print("Purchase is successfull")
                
                switch verification {
                case .verified(let transaction):
                    if transaction.revocationDate == nil {
                        purchasedIds.append(transaction.productID)
                    }
                    
                    else {
                        purchasedIds.removeObject(transaction.productID)
                    }
                    await transaction.finish()
                    print(transaction.productID)
                    print(purchasedIds.count)
                    
                    
                case .unverified(_):
                    break;
                }
            case .userCancelled:
                break;
        
            case .pending:
                break;
                
            default:
                break;
                    }
                }
            }
    
    func isPurchased(product: Product) async throws -> Bool {
        guard let state = await product.currentEntitlement
        else {return false}
        //print(state)
        
            switch state {
                
            case .verified(_):
                return true
                
            case .unverified(_):
                print("Purchase isn't verified")
                return false
            
            }

    }
    
    func isHaveActiveSubscribe() async throws -> Bool {
        true
    }
    
    func restoreSubscribe() async throws {
        
    }
    
}

    

