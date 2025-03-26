//
//  ContentView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        StopButton(action: {
            print("Stop button pressed!")
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
