//
//  Item.swift
//  COMP3097_Project_G19
//
//  Created by Benn Graham on 2026-03-08.
//

import Foundation
import SwiftData

@Model
final class Task {
    var timestamp: Date
    var task_category: TaskCategory?
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
