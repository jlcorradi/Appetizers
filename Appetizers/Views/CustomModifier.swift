//
//  CustomModifier.swift
//  Appetizers
//
//  Created by Jorge Corradi on 01/06/24.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accent)
            .controlSize(.large)
    }
    
}
