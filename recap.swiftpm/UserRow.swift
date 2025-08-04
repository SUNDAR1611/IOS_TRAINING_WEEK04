//
//  UserRow.swift
//  recap
//
//  Created by cs_ios on 04/08/25.
//

import SwiftUI

struct UserRow: View {
    @Binding var user: UserModel

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $user.name)
                .font(.headline)
            TextField("UserName", text: $user.name)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
