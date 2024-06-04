//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Jorge Corradi on 01/06/24.
//

import SwiftUI

final class OrderContext: ObservableObject {
    @Published var items: [Appetizer] = []
    
    var totalOrder: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func addItem(item: Appetizer) {
        items.append(item)
    }
    
    func removeItem(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
