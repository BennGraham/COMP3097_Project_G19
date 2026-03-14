//
//  CategoryDetails.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-09.
//

import SwiftUI
import SwiftData

struct CategoryDetails: View {
    @Environment(\.modelContext) private var modelContext
    let category: TaskCategory
    @State private var showingAddTask = false

    var body: some View {
        List {
            ForEach(category.tasks) { task in
                NavigationLink {
                    TaskDetails(task: task)
                } label: {
                    TaskListItem(task: task)
                }
                .swipeActions(edge: .leading) {
                    Button {
                        task.completedAt = task.completedAt == nil ? Date() : nil
                    } label: {
                        Label(
                            task.completedAt == nil ? "Complete" : "Undo",
                            systemImage: task.completedAt == nil ? "checkmark.circle" : "xmark.circle"
                        )
                    }
                    .tint(.green)
                }
            }
            .onDelete(perform: deleteTasks)
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
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(category.tasks[index])
            }
        }
    }
}


#Preview {
    CategoryDetails(category: TaskCategory(name: "Todos"))
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
