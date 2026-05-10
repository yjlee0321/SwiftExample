//
//  TodoRowView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/28/26.
//

import SwiftUI

struct TodoRowView: View {
    let todo: TodoItem
    
    @State private var showingEditView: Bool = false
    
    var body: some View {
        HStack{
            
            Image(systemName: todo.isCompleted ?
                  "checkmark.square.fill" : "square")
            .foregroundColor(todo.isCompleted ? .green: .gray)
                
                VStack(alignment: .leading){
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                    if let dueDate = todo.dueDate {
                        Text(dueDate, format: Date.FormatStyle(date: .numeric, time: .standard))
                            .font(.caption)
                            .foregroundStyle(dueDate > Date.now ? .gray : .red)
                    }
                }
            Spacer()
            PriorityBadge(priority: todo.priority)
        
        }
        .onTapGesture {
            todo.isCompleted.toggle()
        }
        .onLongPressGesture(minimumDuration: 0.5) {
            showingEditView = true
        }
        .swipeActions(edge: .leading) {
            NavigationLink(value: TodoNavigation.detail(todo)) {
                Text("Detail")
            }
            .tint(.yellow)
        }
        .sheet(isPresented: $showingEditView) {
            // EditTodoView 안에서 빠진 NavigationStack을 추가함
            // (팝업일 경우, 네비게이션 바 제목을 출력하려면 독립적인 NavigationStack 따로 필요함)
            NavigationStack {
                EditTodoView(todo: todo)
            }
        }
    }
}

#Preview {
    NavigationStack{
        List{
            TodoRowView(todo: TodoItem(title: "Hello, World!", dueDate: Date().addingTimeInterval(-1000)))  // 타임 인터벌을 사용해서 과거, 현재에 따른 글자색 변화를 프리뷰에서 확인 가능
        }
        .navigationTitle("Todo List")
    }
}
