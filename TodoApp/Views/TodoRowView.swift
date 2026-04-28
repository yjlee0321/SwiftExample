//
//  TodoRowView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/28/26.
//

import SwiftUI

struct TodoRowView: View {
    let item: TodoItem
    
    @State private var showingEditView: Bool = false
    
    var body: some View {
        HStack{
            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
                .onLongPressGesture {
                    showingEditView = true
                }
            NavigationLink(value: TodoNavigation.detail(item)){
                Text(" ")
            }
        }
        .swipeActions(edge: .leading) {
            NavigationLink(value: TodoNavigation.detail(item)) {
                Text("Edit")
            }
            .tint(.yellow)
        }
        .sheet(isPresented: $showingEditView) {
            NavigationStack {
                EditTodoView(todo: item)
            }
        }
    }
}

#Preview {
    TodoRowView(item: TodoItem(title: "Hello, World!"))
}
