//
//  UserModel.swift
//  recap
//
//  Created by cs_ios on 04/08/25.
//

import Foundation

struct UserModel: Identifiable {
    let id: UUID = UUID()
    var name: String
    var username: String
}
