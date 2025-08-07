//
//  ContentView.swift
//  Day4_GitPractice
//
//  Created by cs_ios on 07/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Recipe App")
                .font(.title).foregroundColor(.blue)
                .padding()

            Text("TAP Search and explore your favorite recipes")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ContentView()
}
