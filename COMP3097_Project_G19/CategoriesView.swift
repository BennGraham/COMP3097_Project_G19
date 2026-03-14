//
//  CategoriesView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-09.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [TaskCategory]
    @State private var searchQuery = ""
    @State private var showingAddCategory = false

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
                            .font(.body)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(Circle())

                        Text(category.name)
                            .font(.body)
                    }
                    .padding(.vertical, 6)
                }
            }
            .onDelete(perform: deleteCategories)
            
            if filteredCategories.isEmpty {
                ContentUnavailableView(
                    "No Categories",
                    systemImage: "folder",
                    description: Text("Add a category to get started")
                )
            }
        }
        .navigationTitle("Categories")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingAddCategory = true }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddCategory) {
            CreateCategoryView()
        }

        if categories.count > 7 {
            list.searchable(text: $searchQuery, prompt: "Search categories")
        } else {
            list
        }
    }
    
    private func deleteCategories(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(filteredCategories[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        CategoriesView()
            .modelContainer(for: [TaskItem.self, TaskCategory.self], inMemory: true)
    }
}
