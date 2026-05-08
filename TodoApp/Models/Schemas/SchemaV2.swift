//
//  SchemaV1.swift
//  TodoApp
//
//  Created by 이윤정 on 5/8/26.
//

import Foundation
import SwiftData

enum SchemaV2: VersionedSchema {
    static var versionIdentifier = Schema.Version(2, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [TodoItem.self, Category.self]
    }
    
    @Model
    final class TodoItem {
        var id: String = UUID().uuidString
        var title: String = ""
        var isCompleted: Bool = false
        var dueDate: Date?  // 마감일이 없는 경우도 있을 수 있으니 옵셔널
        var category: Category? = nil
        var createdAt: Date = Date()
        var priority: Priority = Priority.medium
        
        init(title: String,
             isCompleted: Bool = false,
             priority: Priority = Priority.medium,
             dueDate: Date? = nil,
             category: Category? = nil,
             createdAt: Date = Date()) {
            self.title = title
            self.isCompleted = false
            self.priority = priority
            self.dueDate = dueDate
            self.category = category
            self.createdAt = createdAt
        }
    }

}
