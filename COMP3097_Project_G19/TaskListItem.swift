//
//  TaskListItem.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-13.
//

import SwiftUI

struct TaskListItem: View {
    let task: TaskItem

    var body: some View {
        HStack(spacing: 12) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: task.task_category?.icon.rawValue ?? "circle")
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())

                if task.completedAt != nil {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.body)
                        .foregroundColor(.green)
                        .background(Color(UIColor.systemBackground))
                        .clipShape(Circle())
                        .offset(x: 6, y: -6)
                }
            }
            Text(task.title)
                .strikethrough(task.completedAt != nil)
                .foregroundColor(task.completedAt != nil ? .secondary : .primary)
        }
        .padding(.vertical, 4)
    }
}
