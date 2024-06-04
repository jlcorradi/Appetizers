//
//  AccountView.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var vm = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Personal Info"))
                {
                    TextField("First Name", text: $vm.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $vm.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $vm.user.email)
                        .focused($focusedTextField, equals: .email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .onSubmit {
                            focusedTextField = nil
                        }
                        .submitLabel(.continue)
                    
                    //DatePicker("Birth day", selection: $vm.user.birthDate, displayedComponents: .date)
                    DatePicker("Birth Date",
                               selection:$vm.user.birthDate,
                               in: Date().oneHundredTenYearsAgo...Date().eithteenYearsAgo,
                               displayedComponents: .date)
                    Button {
                        vm.saveChanges()
                    } label: {
                        Text("Save Changes")
                            .foregroundColor(.customPrimary)
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $vm.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $vm.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .customPrimary))
                .accentColor(.customPrimary)
             
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { focusedTextField = nil }
                }
            }
        }
        .alert(item: $vm.validationAlert) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            vm.retrieveUser()
        }
    }
}

#Preview {
    AccountView()
}
