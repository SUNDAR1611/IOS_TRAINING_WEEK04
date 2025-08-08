//
//  TaskRepository.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

protocol TaskRepository {
    func getTasks() -> [Task]
    func addTask(title: String, description: String)
    func deleteTask(id: UUID)
    func updateTask(_ task: Task) 
}
