//
//  User.swift
//  Appetizers
//
//  Created by Jorge Corradi on 01/06/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}

