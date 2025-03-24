//
//  ContentView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StepProgressView(steps: 1500, goal: 6000)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
