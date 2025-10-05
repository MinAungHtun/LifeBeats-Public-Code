//
//  Store.swift
//  LifeBeats
//
//  Created by User on 12/23/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import StoreKit

class Store : NSObject, ObservableObject
{
    private let productID = "com.premiumYearly.id"
    private var productRequest : SKProductsRequest?
    private var fetchedProducts = [SKProduct]()
    private var fetchCompletionHandler : (([SKProduct]) -> Void)?
}


extension Store : SKProductsRequestDelegate
{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let loadedProduct = response.products
        let invalidProduct = response.invalidProductIdentifiers
        
        guard !loadedProduct.isEmpty else {
            print("Could not load Products")
            if !invalidProduct.isEmpty
            {
                print("Invalid Product Found: \(invalidProduct)")
            }
            return
        }
        
        fetchedProducts = loadedProduct

        DispatchQueue.main.async {
            self.fetchCompletionHandler?(loadedProduct)
            self.fetchCompletionHandler = nil
        }
        
        
    }
    
    
}
