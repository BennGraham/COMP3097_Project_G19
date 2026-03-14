//
//  CreateTaskView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

import SwiftUI
import SwiftData

struct CreateTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var categories: [TaskCategory]

    @State private var title = ""
    @State private var taskDescription = ""
    @State private var dueDate = Date()
    @State private var includeDueDate = false
    @State private var selectedCategory: TaskCategory? = nil
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Required", text: $title)
                }

                Section("Description") {
                    TextField("Optional", text: $taskDescription)
                }

                Section("Due Date") {
                    Toggle("Set due date", isOn: $includeDueDate)
                    if includeDueDate {
                        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    }
                }

                Section("Category") {
                    Picker("Category", selection: $selectedCategory) {
                        Text("None").tag(nil as TaskCategory?)
                        ForEach(categories) { category in
                            Text(category.name).tag(category as TaskCategory?)
                        }
                    }
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let task = TaskItem(
                            title: title,
                            taskDescription: taskDescription,
                            dueDate: includeDueDate ? dueDate : nil,
                            task_category: selectedCategory
                        )
                        modelContext.insert(task)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
