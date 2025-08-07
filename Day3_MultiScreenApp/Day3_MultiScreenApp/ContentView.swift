//
//  ContentView.swift
//  Day3_MultiScreenApp
//
//  Created by cs_ios on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var recipeName = ""
    @State private var recipes: [RecipeModel] = []
    let recipeClient = RecipeClient()
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter the Recipe name", text: $recipeName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                            Task {
                                do {
                                    recipes = try await recipeClient.searchRecipe(for: recipeName)
                                    errorMessage = nil
                                } catch RecipeClient.NetworkError.invalidResponse {
                                    errorMessage = "Not available."
                                    recipes = []
                                } catch {
                                    errorMessage = "An error occurred."
                                    recipes = []
                                }
                            }
                        }

                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.bottom)
                    }

                List(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            AsyncImage(url: URL(string: recipe.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } placeholder: {
                                ProgressView()
                            }

                            Text(recipe.title)
                                .font(.headline)
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Search Recipes")
            .foregroundStyle(.secondary)
        }
    }
}
    


#Preview {
    ContentView()
}
