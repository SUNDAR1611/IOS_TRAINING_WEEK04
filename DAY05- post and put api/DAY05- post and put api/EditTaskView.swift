//
//  Untitled.swift
//  DAY05- post and put api
//
//  Created by cs_ios on 08/08/25.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var task: Task
    var viewModel: TaskViewModel

    var body: some View {
        Form {
            TextField("Title", text: $task.title)
            TextField("Description", text: $task.description)
            Button("Save") {
                viewModel.editTask(task)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit Task")
    }
}

