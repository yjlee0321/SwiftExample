//
//  ContentView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/25/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [TodoItem]
    
    @State private var showingAddTodo = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { item in
                    NavigationLink {
                        TodoDetailView(item: item)
                    } label: {
                        Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle(Text("Todo Lists"))
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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}

