//
//  APPButton.swift
//  Appetizers
//
//  Created by Jorge Corradi on 31/05/24.
//

import SwiftUI

struct APPButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.customPrimary)
            .cornerRadius(10)
    }
}
