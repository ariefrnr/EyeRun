//
//  ContentView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var manager: HealthManager
    var body: some View {
        BaselineTrackerView()
            .environmentObject(GoalsManager())
    }
}

#Preview {
    ContentView()
}
