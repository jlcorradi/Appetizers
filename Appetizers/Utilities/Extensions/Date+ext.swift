//
//  Date+ext.swift
//  Appetizers
//
//  Created by Jorge Corradi on 02/06/24.
//

import Foundation

extension Date {
    var eithteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
