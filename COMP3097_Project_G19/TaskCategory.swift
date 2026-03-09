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
    @Relationship(deleteRule: .nullify, inverse: \Task.category)
    var tasks: [Task] = []

    init(name: String) {
        self.name = name
    }
}
