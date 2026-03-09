//
//  CategoriesView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-09.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Query private var categories: [TaskCategory]

    var body: some View {
        List {
            ForEach(categories) { category in
                NavigationLink(category.name) {
                    CategoryDetails(category: category)
                }
            }
        }
        .navigationTitle("Categories")
    }
}

#Preview {
    CategoriesView()
        .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
}
