//
//  COMP3097_Project_G19App.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-08.
//

import SwiftUI
import SwiftData

@main
struct COMP3097_Project_G19App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TaskItem.self,
            TaskCategory.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let context = sharedModelContainer.mainContext
                    let existing = try? context.fetch(FetchDescriptor<TaskCategory>())
                    if existing?.isEmpty ?? true {
                        context.insert(TaskCategory(name: "Todos"))
                    }
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
