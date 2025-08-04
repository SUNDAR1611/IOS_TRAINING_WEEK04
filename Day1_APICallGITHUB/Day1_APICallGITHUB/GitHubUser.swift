//
//  Postview.swift
//  Day1_APICallGITHUB
//
//  Created by cs_ios on 04/08/25.
//

import Foundation

struct GitHubUser: Identifiable, Codable {
    let id: Int
    let login: String
    let avatar_url: String
    let html_url: String
}

