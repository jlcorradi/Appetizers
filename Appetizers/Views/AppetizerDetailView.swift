//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Jorge Corradi on 31/05/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var orderContext: OrderContext
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 225)
//                    .cornerRadius(8)
//            } placeholder: {
//                Image("food-placeholder.png")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 300, height: 225)
//                    .cornerRadius(8)
//            }
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
            }
            
            HStack(spacing: 40) {
                NutritionInfo(label: "Calories", value: "\(appetizer.calories)")
                NutritionInfo(label: "Carbs", value: "\(appetizer.carbs)")
                NutritionInfo(label: "Protein", value: "\(appetizer.protein)")
            }
            
            Spacer()
            
            Button {
                orderContext.addItem(item: appetizer)
                isShowingDetail = false
            } label: {
//                APPButton(title: "\(appetizer.price, specifier: "%.2f") - Add to Cart")
                Text("\(appetizer.price, specifier: "%.2f") - Add to Cart")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct NutritionInfo: View {
    var label: LocalizedStringKey
    var value: String
    
    var body: some View {
        VStack {
            Text(label)
                .bold()
                .font(.caption)
                
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(isShowingDetail: .constant(true), appetizer: MockData.sampeAppetizer)
        .environmentObject(OrderContext())
}



