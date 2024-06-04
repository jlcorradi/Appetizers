//
//  ContentView.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orderContext: OrderContext
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(orderContext.items.count)
        }
        .accentColor(.customPrimary)
    }
}

#Preview {
    AppetizerTabView().environmentObject(OrderContext())
}
