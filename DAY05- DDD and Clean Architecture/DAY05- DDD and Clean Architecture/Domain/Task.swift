//
//  Task.swift
//  DAY05- DDD and Clean Architecture
//
//  Created by cs_ios on 08/08/25.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var isCompleted: Bool
}

