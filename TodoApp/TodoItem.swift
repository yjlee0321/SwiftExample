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
    
    init(title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.title = title
        self.isCompleted = false
        self.createdAt = createdAt
    }
}
