//
//  ContentView.swift
//  Day2_ErrorHandling
//
//  Created by cs_ios on 05/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading posts...")
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                            Text(post.body)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            Task {
                await viewModel.fetchPosts()
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}


#Preview {
    ContentView()
}
