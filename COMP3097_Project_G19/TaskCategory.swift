//
//  Category.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-08.
//

import Foundation
import SwiftData

@Model
final class TaskCategory {
    var name: String
    var icon: CategoryIcon
    @Relationship(deleteRule: .nullify, inverse: \TaskItem.task_category)
    var tasks: [TaskItem] = []

    init(name: String, icon: CategoryIcon = .category_other) {
        self.name = name
        self.icon = icon
    }

    enum CategoryIcon: String, Codable, CaseIterable {
        case category_work = "briefcase.fill"
        case category_personal = "person.fill"
        case category_shopping = "cart.fill"
        case category_health = "heart.fill"
        case category_school = "book.fill"
        case category_finance = "dollarsign.circle.fill"
        case category_travel = "airplane"
        case category_home = "house.fill"
        case category_fitness = "figure.run"
        case category_other = "folder.fill"
    }
}
