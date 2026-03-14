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
        NavigationStack {
            TaskList(tasks: tasks)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink("Categories") {
                            CategoriesView()
                        }
                    }
                }
        }
    }
}



#Preview {
    let container = try! ModelContainer(for: Schema([TaskItem.self, TaskCategory.self]), configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    MockData.seed(into: container.mainContext)
    return HomeView()
            .modelContainer(container)
            .preferredColorScheme(.dark)
}
