//
//  Models.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham | 101412278 on 2026-03-13.
//

import Foundation
import SwiftData

struct MockData {
    static func seed(into context: ModelContext) {
        let work     = TaskCategory(name: "Work", icon: .category_work)
        let personal = TaskCategory(name: "Personal", icon: .category_personal)
        let shopping = TaskCategory(name: "Shopping", icon: .category_shopping)
        let health   = TaskCategory(name: "Health", icon: .category_health)
        let school   = TaskCategory(name: "School", icon: .category_school)
        let finance  = TaskCategory(name: "Finance", icon: .category_finance)
        let travel   = TaskCategory(name: "Travel", icon: .category_travel)
        let home     = TaskCategory(name: "Home", icon: .category_home)
        let fitness  = TaskCategory(name: "Fitness", icon: .category_fitness)
        let other    = TaskCategory(name: "Other", icon: .category_other)

        let categories = [work, personal, shopping, health, school, finance, travel, home, fitness, other]
        for category in categories { context.insert(category) }

        let tasks: [TaskItem] = [
            TaskItem(
                title: "Task 1",
                taskDescription: "Task 1 Description",
                dueDate: date("2026-03-20"),
                task_category: work
            ),
            TaskItem(
                title: "Task 2",
                taskDescription: "Task 2 Description",
                dueDate: date("2026-03-14"),
                task_category: work
            ),
            TaskItem(
                title: "Task 3",
                taskDescription: "Task 3 Description",
                dueDate: date("2026-03-16"),
                completedAt: Date(),
                task_category: work
            ),
            TaskItem(
                title: "Task 4",
                taskDescription: "Task 4 Description",
                dueDate: date("2026-03-15"),
                task_category: personal
            ),
            TaskItem(
                title: "Task 5",
                taskDescription: "Task 5 Description",
                dueDate: date("2026-04-01"),
                task_category: personal
            ),
            TaskItem(
                title: "Task 6",
                taskDescription: "Task 6 Description",
                dueDate: date("2026-03-14"),
                task_category: shopping
            ),
            TaskItem(
                title: "Task 7",
                taskDescription: "Task 7 Description",
                dueDate: nil,
                task_category: shopping
            ),
            TaskItem(
                title: "Task 8",
                taskDescription: "Task 8 Description",
                dueDate: date("2026-03-18"),
                task_category: health
            ),
            TaskItem(
                title: "Task 9",
                taskDescription: "Task 9 Description",
                dueDate: date("2026-03-13"),
                completedAt: Date(),
                task_category: health
            ),
            TaskItem(
                title: "Task 10",
                taskDescription: "Task 10 Description",
                dueDate: date("2026-03-05"),
                task_category: school
            ),
            TaskItem(
                title: "Task 11",
                taskDescription: "Task 11 Description",
                dueDate: date("2026-03-22"),
                task_category: school
            ),
            TaskItem(
                title: "Task 12",
                taskDescription: "Task 12 Description",
                dueDate: date("2026-03-31"),
                task_category: finance
            ),
            TaskItem(
                title: "Task 13",
                taskDescription: "Task 13 Description",
                dueDate: date("2026-03-30"),
                task_category: finance
            ),
            TaskItem(
                title: "Task 14",
                taskDescription: "Task 14 Description",
                dueDate: date("2026-03-02"),
                task_category: travel
            ),
            TaskItem(
                title: "Task 15",
                taskDescription: "Task 15 Description",
                dueDate: date("2026-03-21"),
                task_category: travel
            ),
            TaskItem(
                title: "Task 16",
                taskDescription: "Task 16 Description",
                dueDate: date("2026-03-07"),
                task_category: home
            ),
            TaskItem(
                title: "Task 17",
                taskDescription: "Task 17 Description",
                dueDate: nil,
                task_category: home
            ),
            TaskItem(
                title: "Task 18",
                taskDescription: "Task 18 Description",
                dueDate: date("2026-03-13"),
                completedAt: Date(),
                task_category: fitness
            ),
            TaskItem(
                title: "Task 19",
                taskDescription: "Task 19 Description",
                dueDate: date("2026-03-15"),
                task_category: fitness
            ),
            TaskItem(
                title: "Task 20",
                taskDescription: "Task 20 Description",
                dueDate: nil,
                task_category: other
            ),
            TaskItem(
                title: "Task 21",
                taskDescription: "Task 21 Description",
                dueDate: nil,
                task_category: other
            ),
        ]

        for task in tasks { context.insert(task) }
    }

    private static func date(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: string) ?? Date()
    }
}
