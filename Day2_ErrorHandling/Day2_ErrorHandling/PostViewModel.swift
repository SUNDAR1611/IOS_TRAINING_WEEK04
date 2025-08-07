//
//  ViewModel.swift
//  Day2_ErrorHandling
//
//  Created by cs_ios on 05/08/25.
//

import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    func fetchPosts() async {
        isLoading = true
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            self.isLoading = false
            self.errorMessage = "Invalid URL"
            self.showError = true
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch is DecodingError {
            errorMessage = "Failed to decode data"
            showError = true
        } catch {

            errorMessage = "Somthing went wrong: \(error.localizedDescription)"

            errorMessage = "Somthing went wrong:\(error.localizedDescription)"

            showError = true
            errorMessage = " now you connect:\(error.localizedDescription)"

        }
        isLoading = false
    }
}


