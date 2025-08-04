
import SwiftUI

struct ContentView: View {
    @State private var users: [UserModel] = [
        UserModel(name: "John Doe", username: "johndoe"),
        UserModel(name: "Jane Smith", username: "janesmith"),
    ]
    @State private var newName = ""
    @State private var newUsername = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $newName)
                    TextField("Username", text: $newUsername)
                        
                    Button("Add User") {
                        let user = UserModel(name: newName, username: newUsername)
                        users.append(user)
                        newName = ""
                        users.append(user)
                        newUsername = ""
                    }
                    .padding(.top)
                    .foregroundStyle(.blue)
                    .disabled(newName.isEmpty || newUsername.isEmpty)
                }

                List {
                    ForEach($users) { $user in
                        UserRow(user: $user)
                    }
                    .onDelete { users.remove(atOffsets: $0) }
                }
            }
            .navigationTitle("Users")
            .toolbar {
                EditButton()
            }
        }
    }
}


