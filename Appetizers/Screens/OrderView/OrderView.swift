//
//  OrderView.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderContext: OrderContext
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderContext.items) { item in
                            AppetizerListCell(appetizer: item)
                                .listRowSeparator(.visible)
                        }
                        .onDelete(perform: orderContext.removeItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                    
                    Button {
                        print("Order Placed")
                    } label: {
                        Text("\(orderContext.totalOrder, specifier: "$%.2f") - Place Order ")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                .navigationTitle("🧾 Orders")
                
                if orderContext.items.isEmpty {
                    EmptyState(imageName: "checklist.unchecked", message: "You have no items in your order \nPlease, add an appetizer.")
                }
            }
        }
    }
}

#Preview {
    OrderView().environmentObject(OrderContext())
}
