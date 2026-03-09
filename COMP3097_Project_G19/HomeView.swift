//
//  ContentView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-08.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [TaskItem]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        Text("Task at \(task.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(task.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTask) {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a task")
        }
    }

    private func addTask() {
        withAnimation {
            let newTask = TaskItem(timestamp: Date())
            modelContext.insert(newTask)
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
