//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var orderContext = OrderContext()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(orderContext)
        }
    }
}
