//
//  EditTodoView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/27/26.
//

import SwiftUI

struct EditTodoView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let todo: TodoItem
    
    @State private var title: String = ""
    @State private var priority: Priority
    @State private var dueDateEnabled = false
    @State private var dueDate: Date? = nil
    
    init(todo: TodoItem) {
        self.todo = todo
        self._title = State(initialValue: todo.title)
        self._priority = State(initialValue: todo.priority)
        self._dueDateEnabled = State(initialValue: todo.dueDate != nil) // dueDate가 not nil이면 true
        self._dueDate = State(initialValue: todo.dueDate)
    }
    
    var body: some View {
            Form {
                Section {
                    TextField("Title", text: $title)
                    Picker("우선 순위", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) {
                            priority in
                            Text(priority.title)
                                .tag(priority)
                        }
                    }
                    Toggle("마감일 설정", isOn: $dueDateEnabled)
                    if dueDateEnabled {
                        DatePicker("마감일",
                                   selection: Binding(get: {
                            dueDate ?? Date()
                        }, set: {
                            dueDate = $0
                        }))
                    }
                }
            }
            .navigationTitle("Edit Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // 수정 기능
                        todo.title = title
                        todo.priority = priority
                        todo.dueDate = dueDateEnabled ? dueDate : nil
                        
                        // 뷰 닫기와 동시에 모델 컨텍스트 저장이 호출됨
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        // 수정 취소 기능
                        dismiss()
                    }
                }
            }
    }
}

#Preview {
    EditTodoView(todo: TodoItem(title: "Hello"))
}
