//
//   MealResponse.swift
//  Day5_SearchableListApp
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]?
}

struct Meal: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    let instructions: String
    let youtubeURL: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case instructions = "strInstructions"
        case youtubeURL = "strYoutube"
    }
}

