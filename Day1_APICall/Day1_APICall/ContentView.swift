//
//  ContentView.swift
//  Day1_APICall
//
//  Created by cs_ios on 04/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.title)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Posts")
            .foregroundColor(.purple)
            .task {
                await viewModel.fetchPosts()
            }
        }
    }
}


