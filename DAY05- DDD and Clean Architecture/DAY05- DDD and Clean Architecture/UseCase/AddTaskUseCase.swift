//
//  AddTaskUseCase.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//
 
import Foundation

class AddTaskUseCase {
    private let repository: TaskRepository

    init(repository: TaskRepository) {
        self.repository = repository
    }

    func execute(title: String, description: String) {
        repository.addTask(title: title, description: description)
    }
}

