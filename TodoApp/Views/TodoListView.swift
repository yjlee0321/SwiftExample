//
//  TodoListView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/28/26.
//

import SwiftUI
import SwiftData

// 한 가지 데이터 타입에 대해서, 다른 네비게이션 경로를 가질 경우
// enum값을 이용해서 분기 처리를 해야 함.
// (NavigationLink는 Hashable값을 가져야 하기 때문에 Hashable 프로토콜을 추가해줌)
enum TodoNavigation: Hashable {
    case detail(TodoItem)
    case edit(TodoItem)
}

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    
    let searchText: String
    
    @Query private var todos: [TodoItem]
    
    init(searchText: String = "") {
        self.searchText = searchText

        let predicate = #Predicate<TodoItem> { todo in
            searchText.isEmpty ? true : todo.title.contains(searchText) == true
        }
        
        _todos = Query(filter: predicate, sort:[SortDescriptor(\TodoItem.createdAt)])
    }
    
    var body: some View {
        List {
            ForEach(todos) { item in
                TodoRowView(todo: item)
            }
            .onDelete(perform: deleteItems)
        }
        .navigationDestination(for: TodoNavigation.self) { navigation in
            switch navigation {
                case .detail(let item):
                    TodoDetailView(item: item)
                case .edit(let item):
                    EditTodoView(todo: item)
            }
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
    TodoListView()
        .modelContainer(PreviewContainer.shared.container)
}

