//
//  Alert.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidData      = AlertItem(
        title: Text("Server Errors"),
        message: Text("The data received from the server was invalid. Please, contact support"),
        dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(
        title: Text("Server Errors"),
        message: Text("The response received from the server was invalid. Please, contact support"),
        dismissButton: .default(Text("Ok")))
    
    static let invalidURL       = AlertItem(
        title: Text("Server Errors"),
        message: Text("There was an issue connecting to the server. If this presists, contact support"),
        dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Errors"),
        message: Text("Unable to complete your request at this time. Please, check your internet connection."),
        dismissButton: .default(Text("Ok")))
    
    //MARK: - Account Alerts
    static let invalidForm = AlertItem(
        title: Text("Missing required information"),
        message: Text("Make sure the fields firstname, lastname and email have value"),
        dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Make sure the email you entered is in a valid format"),
        dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Profile information saved successfully!"),
        dismissButton: .default(Text("Ok")))

    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saving / retrieving your profile data"),
        dismissButton: .default(Text("Ok")))
    
}
