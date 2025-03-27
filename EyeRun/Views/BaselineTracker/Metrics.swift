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
    @State var showModal = false
    var body: some View {
        HStack {
            VStack {
                StepsCard(steps: 1304, goals: 10000)
                StreakCard(streak: 90)
            }
            
            VStack {
                HeartRateCard(heartRate: 90)
                HorizontalButton(buttonName: "Manage Goals")
                    .onTapGesture {
                        showModal = true
                    }
                .sheet(isPresented: $showModal){
                    GoalsModalView()
                }
            }
        }
    }
}

#Preview {
    //    PrimaryMetrics()
    SecondaryMetrics()
}
