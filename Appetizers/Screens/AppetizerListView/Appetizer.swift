//
//  Appetizer.swift
//  Appetizers
//
//  Created by Jorge Corradi on 29/05/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampeAppetizer = Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 )
    static let someAppetizerList = [
        Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 2, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 3, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 4, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 )
    ]
    
    static let orders = [
        Appetizer(id: 1, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 3, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 ),
        Appetizer(id: 4, name: "Asian Flank Steak", description: "This perfectly thin cut just melts in your mouth.", price: 8.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 90, protein: 100, carbs: 200 )

    ]
    
}
