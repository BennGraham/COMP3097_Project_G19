//
//  TaskDetails.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham | 101412278 on 2026-03-09.
//

import SwiftUI
import SwiftData

struct TaskDetails: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable var task: TaskItem
    @Query private var categories: [TaskCategory]
    @State private var includeDueDate: Bool

    init(task: TaskItem) {
        self.task = task
        _includeDueDate = State(initialValue: task.dueDate != nil)
    }

    var body: some View {
        Form {
            Section() {
                TextField("Title", text: $task.title)
            }

            Section {
                Picker("Category", selection: $task.task_category) {
                    Text("None").tag(nil as TaskCategory?)
                    ForEach(categories) { category in
                        Text(category.name).tag(category as TaskCategory?)
                    }
                }
                Toggle("Due Date", isOn: $includeDueDate)
                if includeDueDate {
                    DatePicker(
                        "Date",
                        selection: Binding(
                            get: { task.dueDate ?? Date() },
                            set: { task.dueDate = $0 }
                        ),
                        displayedComponents: .date
                    )
                }
            }
            .onChange(of: includeDueDate) {
                if !includeDueDate { task.dueDate = nil }
            }

            Section("Description") {
                TextEditor(text: $task.taskDescription)
                    .frame(minHeight: 100)
            }

            Section {
                Button(action: {
                    task.completedAt = task.completedAt == nil ? Date() : nil
                }) {
                    Label(
                        task.completedAt == nil ? "Mark as Complete" : "Mark as Incomplete",
                        systemImage: task.completedAt == nil ? "checkmark.circle" : "xmark.circle"
                    )
                }

                Button(role: .destructive) {
                    modelContext.delete(task)
                    dismiss()
                } label: {
                    Label("Delete Task", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Task Details")
    }
}

#Preview {
    TaskDetails(task: TaskItem(title: "Buy groceries"))
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
