//
//  AddTodoView.swift
//  TodoApp
//
//  Created by 이윤정 on 4/27/26.
//

import SwiftUI
import SwiftData

struct AddTodoView: View {
    
    // @Environment는 상위 뷰에서 준 프로퍼티 속성값들 추가
    // 데이터 저장소에 접근할 수 있는 환경 변수
    @Environment(\.modelContext) private var modelContext
    
    // 나를 호출한 뷰에서 닫기 기능을 동작시키는 환경 변수(클로저)
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Title", text: $title)
                }
            }
            .navigationTitle(Text("New Todo"))
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save") {
                        let todo = TodoItem(title: title)
                        modelContext.insert(todo)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTodoView()
}
