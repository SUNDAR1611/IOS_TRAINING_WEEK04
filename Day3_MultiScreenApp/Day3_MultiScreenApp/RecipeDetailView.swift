//
//  RecipeDetailView.swift
//  Day3_MultiScreenApp
//
//  Created by cs_ios on 06/08/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }

                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text("Ingredients")
                    .font(.headline)

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(". \(ingredient)")
                        .padding(.leading)
                }
            }
            .padding()
        }
        .navigationTitle("Recipe Detail")
    }
}
