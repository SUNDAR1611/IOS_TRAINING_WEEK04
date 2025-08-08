//
//  TaskService.swift
//  DAY05- post and put api
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class TaskService {
    let baseURL = "https://jsonplaceholder.typicode.com/posts"

    func createTask(title: String, description: String, completion: @escaping (Task?) -> Void) {
        guard let url = URL(string: baseURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let taskData = Task(id: 0, title: title, description: description)
        request.httpBody = try? JSONEncoder().encode(taskData)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data,
                  let createdTask = try? JSONDecoder().decode(Task.self, from: data) else {
                completion(nil)
                return
            }
            completion(createdTask)
        }.resume()
    }

    func updateTask(_ task: Task, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(task.id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(task)

        URLSession.shared.dataTask(with: request) { _, response, _ in
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(false)
                return
            }
            completion(true)
        }.resume()
    }
    func createTask(id: Int, title: String, description: String, completion: @escaping (Task?) -> Void) {
        guard let url = URL(string: baseURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let taskData = Task(id: id, title: title, description: description)
        request.httpBody = try? JSONEncoder().encode(taskData)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data,
                  let createdTask = try? JSONDecoder().decode(Task.self, from: data) else {
                completion(nil)
                return
            }
            completion(createdTask)
        }.resume()
    }
}
