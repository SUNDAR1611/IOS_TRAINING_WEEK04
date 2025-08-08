//
//  UpdateTaskUseCase.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class UpdateTaskUseCase {
    private let repository: TaskRepository

    init(repository: TaskRepository) {
        self.repository = repository
    }

    func execute(updatedTask: Task) {
        repository.updateTask(updatedTask)
    }
}
