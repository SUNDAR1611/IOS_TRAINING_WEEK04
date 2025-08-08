//
//  EditTaskView.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import SwiftUI

struct EditTaskView: View {
    @State var task: Task
    var onSave: (Task) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Task")) {
                    TextField("Title", text: $task.title)
                    TextField("Description", text: $task.description)
                }
            }
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(task)
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onSave(task) 
                    }
                }
            }
        }
    }
}
