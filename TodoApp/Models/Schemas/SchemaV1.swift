//
//  SchemaV1.swift
//  TodoApp
//
//  Created by 이윤정 on 5/8/26.
//

import Foundation
import SwiftData

enum SchemaV1: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [TodoItem.self]
    }
    
    @Model
    final class TodoItem {
        var id: String = UUID().uuidString
        var title: String = ""
        var isCompleted: Bool = false
        var createdAt: Date = Date()
        var priority: Priority = Priority.medium
        
        init(title: String,
             isCompleted: Bool = false,
             priority: Priority = Priority.medium,
             createdAt: Date = Date()) {
            self.title = title
            self.isCompleted = false
            self.priority = priority
            self.createdAt = createdAt
        }
    }

}
