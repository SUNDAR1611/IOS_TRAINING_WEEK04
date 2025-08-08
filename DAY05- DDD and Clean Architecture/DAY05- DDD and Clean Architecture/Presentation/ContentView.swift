//
//  ContentView.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//
 
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel(repository: InMemoryTaskRepository())

    @State private var newTaskTitle = ""
    @State private var newTaskDescription = ""
    @State private var selectedTask: Task? = nil

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title).font(.headline)
                        Text(task.description).font(.subheadline)
                    }
                    .onTapGesture {
                        selectedTask = task // Open edit sheet
                    }
                }

                // Add Task
                VStack {
                    TextField("New Task Title", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)
                    TextField("Description", text: $newTaskDescription)
                        .textFieldStyle(.roundedBorder)

                    Button("Add Task") {
                        viewModel.createTask(title: newTaskTitle, description: newTaskDescription)
                        newTaskTitle = ""
                        newTaskDescription = ""
                    }
                }.padding()
            }
            .sheet(item: $selectedTask) { task in
                EditTaskView(task: task) { updatedTask in
                    viewModel.editTask(updatedTask)
                    selectedTask = nil
                }
            }
            .navigationTitle("Tasks")
        }
    }
}
#Preview {
    
}
 

    
