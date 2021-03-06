//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ivan Kodrnja on 11.11.2021..
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
 
