//
//  TodoItem.swift
//  TodoApp
//
//  Created by 이윤정 on 4/26/26.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var priority: Priority
    
    init(title: String, isCompleted: Bool = false, priority: Priority = Priority.medium, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = false
        self.priority = priority
        self.createdAt = createdAt
    }
}
