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
                .environmentObject(HealthManager())
        }
    }
}

struct SecondaryMetrics: View {
    @State private var showModal = false
    @State private var goalsManager = GoalsManager()
    @State private var healthManager = HealthManager()
    @State private var streakManager = StreakManager()
    var body: some View {
        HStack {
            VStack {
                StepsCard(steps: healthManager.stepCount ?? 0)
                StreakCard(streak: streakManager.currentStreak)
            }
            
            VStack {
                HeartRateCard(heartRate: healthManager.currentHeartRate ?? 0)
                HorizontalButton(
                    buttonName: "Manage Goals",
                    systemImageName: "gearshape.fill",
                    action: {
                        showModal = true
                    }
                )
                .sheet(isPresented: $showModal) {
                    GoalsModalView()
                }
            }
            .onAppear(){
                healthManager.fetchHeartRate()
                healthManager.fetchStepCount()
                
                healthManager.fetchCaloriesData()
                healthManager.fetchActiveMinutes()
                healthManager.fetchWalkingRunningDistance()
            }
        }    }

}

#Preview {
    //    PrimaryMetrics()
    SecondaryMetrics()
}
