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
    @State private var searchQuery = ""

    var filteredCategories: [TaskCategory] {
        if searchQuery.isEmpty {
            return categories
        }
        return categories.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
    }

    var body: some View {
        let list = List {
            ForEach(filteredCategories) { category in
                NavigationLink {
                    CategoryDetails(category: category)
                } label: {
                    HStack(spacing: 16) {
                        Image(systemName: category.icon.rawValue)
                            .font(.title2)
                            .foregroundColor(.accentColor)
                            .frame(width: 40, height: 40)
                            .background(Color.accentColor.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        Text(category.name)
                            .font(.body)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .navigationTitle("Categories")

        if categories.count > 7 {
            list.searchable(text: $searchQuery, prompt: "Search categories")
        } else {
            list
        }
    }
}

#Preview {
    NavigationStack {
        CategoriesView()
            .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
    }
}
