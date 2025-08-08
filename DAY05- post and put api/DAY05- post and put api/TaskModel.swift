//
//  TaskModel.swift
//  DAY05- post and put api
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: Int
    var title: String
    var description: String
}

