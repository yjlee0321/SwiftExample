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
            // EditTodoView 안에서 빠진 NavigationStack을 추가함
            // (팝업일 경우, 네비게이션 바 제목을 출력하려면 독립적인 NavigationStack 따로 필요함)
            NavigationStack {
                EditTodoView(todo: item)
            }
        }
    }
}

#Preview {
    TodoRowView(item: TodoItem(title: "Hello, World!"))
}
