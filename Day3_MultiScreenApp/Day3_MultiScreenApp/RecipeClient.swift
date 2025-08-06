//
//  ViewModel.swift
//  Day3_MultiScreenApp
//
//  Created by cs_ios on 06/08/25.
//

import Foundation


struct  RecipeClient {
    
    enum NetworkError: Error {
        case badURL
        case decodingFailed
        case invalidResponse
    }
    
    func searchRecipe(for name: String) async throws -> [RecipeModel] {
        guard let url = URL(string: "https://food2fork.ca/api/recipe/search/?page=2&query=\(name)") else {
            throw NetworkError.badURL
        }


        var request = URLRequest(url: url)
        request.addValue("Token 9c8b06d329136da358c2d00e76946b0111ce2c48", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        guard let decodedData = try? JSONDecoder().decode(RecipeResponse.self, from: data) else {
            throw NetworkError.decodingFailed
        }

        return decodedData.results
    }
    }

