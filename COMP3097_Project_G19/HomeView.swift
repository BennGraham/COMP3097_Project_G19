//
//  ContentView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-08.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var tasks: [TaskItem]

    var body: some View {
        NavigationSplitView {
            TaskList(tasks: tasks)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink("Categories") {
                            NavigationStack {
                                CategoriesView()
                            }
                        }
                    }
                }
        } detail: {
            Text("Select a task")
        }
    }
}


#Preview {
    let container = try! ModelContainer(for: Schema([TaskItem.self, TaskCategory.self]), configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    MockData.seed(into: container.mainContext)
    return HomeView().modelContainer(container)
}
