//
//  ContentView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/25/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {    
    @State private var showingAddTodo = false

    var body: some View {
        NavigationStack {
            TodoListView()
                .navigationTitle("Todo Lists")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: {
                            showingAddTodo = true
                        }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
            
        .sheet(isPresented: $showingAddTodo) {
            AddTodoView()
        }
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}

