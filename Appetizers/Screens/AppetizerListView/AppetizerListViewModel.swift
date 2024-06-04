//
//  APViewModel.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    @Published var isShowingDetail: Bool = false
    @Published var selectedItem: Appetizer?
    
    func fetchAppetizersAsync() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.executeHttpGetAsync()
                isLoading = false
            } catch {
                isLoading = false
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                    return
                }
                
                alertItem = AlertContext.invalidResponse
                
            }
        }
    }
    
    func fetchAppetizers() {
        isLoading = true
        
        NetworkManager.shared.executeHttpGet() { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData: 
                        self.alertItem = AlertContext.invalidData
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
                
            }
        }
    }
}
