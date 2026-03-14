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
    @State private var showingAddTask = false

    var body: some View {
        List {
            ForEach(category.tasks) { task in
                NavigationLink {
                    TaskDetails(task: task)
                } label: {
                    Text(task.title)
                }
            }
        }
        .navigationTitle(category.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddTask = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView(preselectedCategory: category)
        }
    }
}


#Preview {
    CategoryDetails(category: TaskCategory(name: "Todos"))
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
