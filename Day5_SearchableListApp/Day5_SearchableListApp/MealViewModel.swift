//
//  MealViewModel.swift
//  Day5_SearchableListApp
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var searchText = ""
    
    private var allMeals: [Meal] = []
    private var currentPage = 0
    private let pageSize = 10

    func fetchMeals(query: String = "Arrabiata") {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(encodedQuery)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            if let result = try? JSONDecoder().decode(MealResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.allMeals = result.meals ?? []
                    self.currentPage = 1
                    self.meals = Array(self.allMeals.prefix(self.pageSize))
                }
            }
        }.resume()
    }

    func loadMoreMealsIfNeeded(currentMeal meal: Meal) {
        guard let last = meals.last else { return }
        if last.id == meal.id && meals.count < allMeals.count {
            currentPage += 1
            let nextMeals = allMeals.prefix(currentPage * pageSize)
            meals = Array(nextMeals)
        }
    }

    func refresh() {
        fetchMeals(query: searchText.isEmpty ? "Arrabiata" : searchText)
    }
}

