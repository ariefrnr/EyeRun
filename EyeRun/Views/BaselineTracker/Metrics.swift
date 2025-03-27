//
//  Metrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct PrimaryMetrics: View {
    var body: some View {
        HStack {
            Image(systemName: "figure.run")
                .resizable()
                .frame(width: 200, height: 350)
                .padding()
            
            MainMetrics()
        }
    }
}

struct SecondaryMetrics: View {
    var body: some View {
        HStack {
            VStack {
                StepsCard(steps: 1304, goals: 10000, heartRate: 96, streak: 23)
                StepsCard(steps: 1304, goals: 10000, heartRate: 96, streak: 23)
            }
            
            VStack {
                StepsCard(steps: 1304, goals: 10000, heartRate: 96, streak: 23)
                HorizontalButton(buttonName: "Manage Goals")
            }
        }
    }
}

#Preview {
    PrimaryMetrics()
//    SecondaryMetrics()
}
