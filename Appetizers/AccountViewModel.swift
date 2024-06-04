//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Jorge Corradi on 01/06/24.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    @Published var user = User()
    @AppStorage("user") private var userData: Data?
    
    @Published var validationAlert: AlertItem?
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            validationAlert = AlertContext.userSaveSuccess
        } catch {
            validationAlert = AlertContext.invalidUserData
        }
        
    }
    
    func retrieveUser() {
        guard let userData = userData else { return }
        do {
            self.user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            validationAlert = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            validationAlert = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            validationAlert = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
}

extension String {
    var isValidEmail: Bool {
        let emailFormat = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
