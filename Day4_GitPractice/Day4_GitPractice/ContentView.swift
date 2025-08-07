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
            Image("logo")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                            .frame(width: 150, height: 150)
                            .padding()

            Text("Welcome to the Recipe App")
                .font(.title).foregroundColor(.black)
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
