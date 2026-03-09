//
//  CategoryDetails.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-09.
//

import SwiftUI
import SwiftData

struct CategoryDetails: View {
    let category: TaskCategory

    var body: some View {
        List {
            Text("Tasks in category")
        }
        .navigationTitle(category.name)
    }
}

#Preview {
    CategoryDetails(category: TaskCategory(name: "Todos"))
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
