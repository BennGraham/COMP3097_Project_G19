//
//  Item.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham | 101412278 on 2026-03-08.
//

import Foundation
import SwiftData

@Model
final class TaskItem {
    var title: String
    var taskDescription: String
    var dueDate: Date?
    var createdAt: Date
    var completedAt: Date?
    var task_category: TaskCategory?

    init(title: String, taskDescription: String = "", dueDate: Date? = nil, completedAt: Date? = nil, task_category: TaskCategory? = nil) {
        self.title = title
        self.taskDescription = taskDescription
        self.dueDate = dueDate
        self.task_category = task_category
        self.createdAt = Date()
        self.completedAt = completedAt
    }

}
