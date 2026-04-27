//
//  TodoDetailView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/27/26.
//

import SwiftUI
import SwiftData

struct TodoDetailView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var item: TodoItem
    
    var body: some View {
        NavigationStack{
            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Delete") {
                            // 삭제 기능
                            modelContext.delete(item)
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Edit") {
                            // 수정 기능
                        }
                    }
                }
        }
    }
}

#Preview {
    TodoDetailView(item: TodoItem(title: "Hello"))
}
