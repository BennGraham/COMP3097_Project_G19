//
//  CreateCategoryView.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

import SwiftUI
import SwiftData

struct CreateCategoryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var selectedIcon: TaskCategory.CategoryIcon = .category_other

    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Required", text: $name)
                }

                Section("Icon") {
                    Picker("Icon", selection: $selectedIcon) {
                        ForEach(TaskCategory.CategoryIcon.allCases, id: \.self) { icon in
                            HStack {
                                Image(systemName: icon.rawValue)
                                Text(icon.name)
                            }
                            .tag(icon)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle("New Category")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        modelContext.insert(TaskCategory(name: name, icon: selectedIcon))
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
