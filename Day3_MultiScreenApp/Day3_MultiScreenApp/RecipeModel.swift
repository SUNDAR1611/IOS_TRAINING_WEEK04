//
//  Model.swift
//  Day3_MultiScreenApp
//
//  Created by cs_ios on 06/08/25.
//

import Foundation


struct RecipeResponse: Codable {
    let results : [RecipeModel]
}

struct RecipeModel: Codable, Identifiable {
    let id : Int
    let title : String
    let image : String
    let ingredients : [String]
    
    private enum CodingKeys : String, CodingKey {
        case id = "pk"
        case title
        case image = "featured_image"
        case ingredients
    }
}

