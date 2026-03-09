//
//  TaskDetails.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-09.
//

import SwiftUI
import SwiftData

struct TaskDetails: View {
    let task: TaskItem

    var body: some View {
        Text("Task details")
            .navigationTitle("Task Details")
    }
}

#Preview {
    TaskDetails(task: TaskItem(timestamp: Date()))
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
