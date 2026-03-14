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
    @State private var showingAddTask = false
    @State private var searchQuery = ""

    var filteredList: [TaskItem] {
        if searchQuery.isEmpty {
            return tasks
        }
        return tasks.filter { $0.title.contains(searchQuery) }
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredList) { task in
                    NavigationLink {
                        TaskDetails(task: task)
                    } label: {
                        Text(task.title)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .searchable(text: $searchQuery, prompt: "Search tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("Categories") {
                        NavigationStack {
                            CategoriesView()
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTask = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a task")
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView()
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
    let container = try! ModelContainer(for: Schema([TaskItem.self, TaskCategory.self]), configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    MockData.seed(into: container.mainContext)
    return HomeView().modelContainer(container)
}
