//
//  TaskList.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    @Environment(\.modelContext) private var modelContext
    let tasks: [TaskItem]
    let preselectedCategory: TaskCategory?
    @State private var showingAddTask = false
    @State private var searchQuery = ""

    init(tasks: [TaskItem], preselectedCategory: TaskCategory? = nil) {
        self.tasks = tasks
        self.preselectedCategory = preselectedCategory
    }

    var filteredTasks: [TaskItem] {
        searchQuery.isEmpty ? tasks : tasks.filter { $0.title.localizedCaseInsensitiveContains(searchQuery) }
    }

    var overdueCount: Int {
        tasks.filter { $0.completedAt == nil && $0.dueDate != nil && $0.dueDate! < Date() }.count
    }
    var atRiskCount: Int {
        tasks.filter {
            $0.completedAt == nil && $0.dueDate != nil &&
            $0.dueDate! >= Date() &&
            $0.dueDate! < Date().addingTimeInterval(2 * 24 * 60 * 60)
        }.count
    }
    var inProgressCount: Int {
        tasks.filter { $0.completedAt == nil }.count
    }

    var body: some View {
        List {
            let cards = [
                ("Overdue",     overdueCount,    Color.red),
                ("At Risk",     atRiskCount,     Color.yellow),
                ("In Progress", inProgressCount, Color.green),
            ].filter { $0.1 > 0 }

            if !cards.isEmpty {
                Section {
                    HStack(spacing: 12) {
                        ForEach(cards, id: \.0) { title, count, color in
                            VStack(spacing: 4) {
                                Text(title).font(.caption).foregroundColor(.secondary)
                                Text("\(count)").font(.title2.bold())
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(color.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                }
            }

            ForEach(filteredTasks) { task in
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
        .searchable(text: $searchQuery, prompt: "Search tasks")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddTask = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            CreateTaskView()
                .modelContainer(modelContext.container)
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(filteredTasks[index])
            }
        }
    }
}
