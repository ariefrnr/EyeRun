//
//  EyeRunApp.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

@main
struct EyeRunApp: App {
    @StateObject private var goalsManager = GoalsManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(goalsManager)
        }
    }
}
