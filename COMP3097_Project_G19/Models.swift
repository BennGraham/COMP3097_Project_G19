//
//  Models.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

struct Task {
    let id: Int
    let title: String
    let description: String
    let dueDate: String
    let priority: Priority
    let isCompleted: Bool
    let categoryId: Int

    enum Priority: String {
        case high = "High", medium = "Medium", low = "Low"
    }

    static let mockTasks: [Task] = [
        Task(id: 1, title: "Prepare Report", description: "Collect data and write summary", dueDate: "Mar 20, 2026", priority: .high, isCompleted: false, categoryId: 1),
        Task(id: 2, title: "Meeting", description: "Team sync", dueDate: "Mar 15, 2026", priority: .medium, isCompleted: true, categoryId: 1),
        Task(id: 3, title: "Groceries", description: "Milk, eggs, bread, and vegetables", dueDate: "Mar 14, 2026", priority: .low, isCompleted: false, categoryId: 3),
        Task(id: 4, title: "Dentist apt", description: "Cleaning", dueDate: "Mar 18, 2026", priority: .medium, isCompleted: false, categoryId: 4),
        Task(id: 5, title: "Work out", description: "Gym in the afternoon", dueDate: "Mar 13, 2026", priority: .low, isCompleted: true, categoryId: 4),
        Task(id: 6, title: "School project", description: "Complete project", dueDate: "Mar 25, 2026", priority: .low, isCompleted: false, categoryId: 2),
        Task(id: 7, title: "Update website", description: "New feedback from last week", dueDate: "Mar 16, 2026", priority: .high, isCompleted: false, categoryId: 1),
        Task(id: 8, title: "Call caterer", description: "Tasting tomorrow afternoon", dueDate: "Mar 17, 2026", priority: .medium, isCompleted: false, categoryId: 3),
    ]

    static func tasks(for categoryId: Int) -> [Task] {
        mockTasks.filter { $0.categoryId == categoryId }
    }
}

struct Category {
    let id: Int
    let name: String
    let icon: String

    static let mockCategories: [Category] = [
        Category(id: 1, name: "Work",     icon: "briefcase.fill"),
        Category(id: 2, name: "Personal", icon: "person.fill"),
        Category(id: 3, name: "Shopping", icon: "cart.fill"),
        Category(id: 4, name: "Health",   icon: "heart.fill"),
    ]
}
