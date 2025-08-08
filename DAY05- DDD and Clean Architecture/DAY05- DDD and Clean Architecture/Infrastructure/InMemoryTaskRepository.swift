//
//  InMemoryTaskRepository.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class InMemoryTaskRepository: TaskRepository {
    private var tasks: [Task] = []

    func getTasks() -> [Task] {
        return tasks
    }

    func addTask(title: String, description: String) {
        let newTask = Task(id: UUID(), title: title, description: description, isCompleted: false)
        tasks.append(newTask)
    }

    func deleteTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }

    }


