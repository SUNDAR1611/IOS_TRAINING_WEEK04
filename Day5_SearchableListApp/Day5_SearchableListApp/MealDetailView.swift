//
//  MealDetailView.swift
//  Day5_SearchableListApp
//
//  Created by cs_ios on 08/08/25.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
               
                AsyncImage(url: URL(string: meal.thumbnail)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .clipped()

               
                Text(meal.name)
                    .font(.title)
                    .fontWeight(.bold)

                Text(meal.instructions)
                    .font(.body)

               
                if let url = URL(string: meal.youtubeURL), !meal.youtubeURL.isEmpty {
                    Link("Watch on YouTube", destination: url)
                        .font(.headline).padding(12)
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            .padding()
        }
        .navigationTitle("Meal Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
