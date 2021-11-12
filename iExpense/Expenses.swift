//
//  Expenses.swift
//  iExpense
//
//  Created by Ivan Kodrnja on 12.11.2021..
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
