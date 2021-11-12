//
//  ContentView.swift
//  iExpense
//
//  Created by Ivan Kodrnja on 10.11.2021..
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
//                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        
                        switch item.amount {
                            case ..<11:
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(Color.green)
                            default:
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(Color.red)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
