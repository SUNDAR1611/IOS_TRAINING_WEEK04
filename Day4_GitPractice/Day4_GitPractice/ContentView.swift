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
<<<<<<< HEAD
            Image(systemName: "book.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
=======
            Image(systemName: "fork.knife.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                            .frame(width: 150, height: 150)
                            .padding()
>>>>>>> feature
            Text("Welcome to the Recipe App")
                .font(.title).foregroundColor(.black)
                .padding()
              Text("have the best day and best cooking")
                .font(.subheadline)
                .foregroundColor(.gray)
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
