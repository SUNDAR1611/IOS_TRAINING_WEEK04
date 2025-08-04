//
//  ContentView.swift
//  Day1_APICallGITHUB
//
//  Created by cs_ios on 04/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GitHubViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.repositories) { user in
                HStack {
                    AsyncImage(url: URL(string: user.avatar_url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(user.login)
                            .font(.headline)
                        Text(user.html_url)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("GitHub Users")
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}
