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
                .padding()
            
            MainMetrics()
        }
    }
}

struct SecondaryMetrics: View {
    var body: some View {
        HStack {
            VStack {
                StepsCard(steps: 1304, goals: 10000)
                StepsCard(steps: 1304, goals: 10000)
            }
            
            VStack {
                StepsCard(steps: 1304, goals: 10000)
                HorizontalButton(buttonName: "Manage Goals")
            }
        }
    }
}

#Preview {
    PrimaryMetrics()
//    SecondaryMetrics()
}
