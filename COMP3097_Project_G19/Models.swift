//
//  Models.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

import Foundation

extension TaskItem {
    static let mockTasks: [TaskItem] = [
        TaskItem(title: "Prepare Report"),
        TaskItem(title: "Meeting",   completedAt: Date()),
        TaskItem(title: "Groceries"),
        TaskItem(title: "Dentist apt"),
        TaskItem(title: "Work out",  completedAt: Date()),
        TaskItem(title: "School project"),
        TaskItem(title: "Update website"),
        TaskItem(title: "Call caterer"),
    ]
}

extension TaskCategory {
    static let mockCategories: [TaskCategory] = [
        TaskCategory(name: "Work",     icon: .category_work),
        TaskCategory(name: "Personal", icon: .category_personal),
        TaskCategory(name: "Shopping", icon: .category_shopping),
        TaskCategory(name: "Health",   icon: .category_health),
        TaskCategory(name: "School",   icon: .category_school),
        TaskCategory(name: "Finance",  icon: .category_finance),
        TaskCategory(name: "Travel",   icon: .category_travel),
        TaskCategory(name: "Home",     icon: .category_home),
        TaskCategory(name: "Fitness",  icon: .category_fitness),
        TaskCategory(name: "Other",    icon: .category_other),
    ]
}
