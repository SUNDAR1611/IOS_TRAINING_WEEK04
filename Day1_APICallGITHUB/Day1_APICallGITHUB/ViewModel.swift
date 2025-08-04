//
//  ViewModel.swift
//  Day1_APICallGITHUB
//
//  Created by cs_ios on 04/08/25.
//

import Foundation

class GitHubViewModel: ObservableObject {
    @Published var repositories: [GitHubUser] = []

    func fetchUsers() async {
        guard let url = URL(string: "https://api.github.com/users") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([GitHubUser].self, from: data)
            DispatchQueue.main.async {
                self.repositories = users
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
