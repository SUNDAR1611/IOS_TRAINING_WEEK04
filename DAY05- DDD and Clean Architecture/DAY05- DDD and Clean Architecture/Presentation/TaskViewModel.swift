//
//  TaskViewModel.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    private let getTasks: GetTasksUseCase
    private let addTask: AddTaskUseCase
    private let deleteTask: DeleteTaskUseCase
    private let updateTask: UpdateTaskUseCase
    
    init(repository: TaskRepository) {
        self.getTasks = GetTasksUseCase(repository: repository)
        self.addTask = AddTaskUseCase(repository: repository)
        self.deleteTask = DeleteTaskUseCase(repository: repository)
        self.updateTask = UpdateTaskUseCase(repository: repository)
        loadTasks()
    }
    
    func loadTasks() {
        tasks = getTasks.execute()
    }
    
    func createTask(title: String, description: String) {
        addTask.execute(title: title, description: description)
        loadTasks()
    }
    
    func removeTask(id: UUID) {
        deleteTask.execute(id: id)
        loadTasks()
    }
    
    func editTask(_ task: Task) {
        updateTask.execute(updatedTask: task)
        loadTasks()
    }
}
