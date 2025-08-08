//
//  ContentView.swift
//  DAY05- post and put api
//
//  Created by cs_ios on 08/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var title = ""
    @State private var description = ""
    @State private var idText = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.tasks) { task in
                        NavigationLink(destination: EditTaskView(task: task, viewModel: viewModel)) {
                            VStack(alignment: .leading) {
                                Text(task.title).font(.headline)
                                Text(task.description).font(.subheadline)
                            }
                        }
                    }
                }
                TextField("ID", text: $idText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    guard let id = Int(idText) else { return }
                    viewModel.addTask(id: id, title: title, description: description)
                    idText = ""
                    title = ""
                    description = ""
                }) {
                    Text("Add Task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
            }
            .padding()
            .navigationTitle("Tasks")
        }
    }
}


#Preview {
    ContentView()
}
