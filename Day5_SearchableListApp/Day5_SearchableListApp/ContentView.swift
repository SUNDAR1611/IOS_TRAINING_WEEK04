//
//  ContentView.swift
//  Day5_SearchableListApp
//
//  Created by cs_ios on 08/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Search meals", text: $viewModel.searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: viewModel.searchText) { newValue in
                        viewModel.fetchMeals(query: newValue)
                    }

                
                List(viewModel.meals) { meal in
                    NavigationLink(destination: MealDetailView(meal: meal)) {
                        HStack {
                            AsyncImage(url: URL(string: meal.thumbnail)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                            Text(meal.name)
                                .font(.headline)
                        }
                        .onAppear {
                            viewModel.loadMoreMealsIfNeeded(currentMeal: meal)
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Meals")
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }
}
#Preview {
    ContentView()
}
