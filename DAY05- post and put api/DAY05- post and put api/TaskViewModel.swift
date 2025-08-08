//
//  TaskViewModel.swift
//  DAY05- post and put api
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let service = TaskService()

    func addTask(title: String, description: String) {
        service.createTask(title: title, description: description) { [weak self] newTask in
            DispatchQueue.main.async {
                if let newTask = newTask {
                    self?.tasks.append(newTask)
                }
            }
        }
    }

    func addTask(id: Int, title: String, description: String) {
        self.service.createTask(id: id, title: title, description: description) { [weak self] newTask in
            DispatchQueue.main.async {
                if let newTask = newTask {
                    self?.tasks.append(newTask)
                }
            }
        }
    }

    func editTask(_ task: Task) {
        service.updateTask(task) { success in
            if success {
                print("Updated task with ID: \(task.id)")
            }
        }
    }
}
