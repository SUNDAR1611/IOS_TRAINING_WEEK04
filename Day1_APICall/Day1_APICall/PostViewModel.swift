//
//  PostViewModel.swift
//  Day1_APICall
//
//  Created by cs_ios on 04/08/25.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Postview] = []

    func fetchPosts() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedPosts = try JSONDecoder().decode([Postview].self, from: data)
            DispatchQueue.main.async {
                self.posts = decodedPosts
            }
        } catch {
            print("Error fetching posts: \(error)")
        }
    }
}
