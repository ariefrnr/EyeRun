//
//  ContentView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var healthManager = HealthManager()
    var body: some View {
        BaselineTrackerView()
            .environmentObject(GoalsManager())
            .environmentObject(HealthManager())
            .onAppear{
                healthManager.requestAuthorization { isSuccess, error in
                    if isSuccess{
                        print("success")
                    } else {
                        print(error?.localizedDescription)
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
