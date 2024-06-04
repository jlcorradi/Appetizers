//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var vm: AppetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(vm.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
//                        .listRowSeparator(.visible)
//                        .listRowSeparatorTint(.secondary)
                        .onTapGesture() {
                            
                            vm.isShowingDetail = true
                            vm.selectedItem = appetizer
                        }
                }
                .navigationBarTitle("🍟 Appetizers")
                .disabled(vm.isShowingDetail)
                .task {
                    vm.fetchAppetizersAsync()
                }
                .blur(radius: vm.isShowingDetail ? 20: 0)
            }
            
            if vm.isShowingDetail {
                AppetizerDetailView(isShowingDetail: $vm.isShowingDetail, appetizer: vm.selectedItem!)
            }
            
            if vm.isLoading {
                LoadingView()
            }
        }
        .alert(item: $vm.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
        .environmentObject(OrderContext())
}
