//
//  Metrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct PrimaryMetrics: View {
    @Binding var selectedDate: Date
    var goalsManager: GoalsManager
    var healthManager: HealthManager
    
    var body: some View {
        HStack {
            Image(.personRun)
                .resizable()
                .frame(width: 200, height: 350)
                .padding()
            
            MainMetrics(goalsManager: goalsManager, healthManager: healthManager, selectedDate: $selectedDate)
        }
    }
}

struct SecondaryMetrics: View {
    @State private var showModal = false
    @StateObject private var streakManager = StreakManager()
    @Binding var selectedDate: Date
    @State var timer: Timer?
    
    var goalsManager: GoalsManager
    var healthManager: HealthManager
    
    var body: some View {
        HStack {
            VStack {
                StepsCard(steps: healthManager.stepCount ?? 0, goalsManager: goalsManager, healthManager: healthManager)
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
                fetchDataStreak()
                autoRefreshOn()
            }
            .onDisappear(){
                autoRefreshOff()
            }
        }
    }

    private func fetchDataStreak() {
        healthManager.fetchAllMetrics(for: selectedDate)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            
            streakManager.checkAndUpdateStreak(healthManager: healthManager, goalsManager: goalsManager)
        }
        
    }

    
    func autoRefreshOn(){
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) {_ in
            fetchDataStreak()
        }
    }
    
    func autoRefreshOff() {
        timer?.invalidate()
        timer = nil
    }
    
}

// Preview
struct Metrics_Previews: PreviewProvider {
    static var previews: some View {
        // Create a static state wrapper for the preview
        PreviewWrapper()
    }
    
    // Helper struct to hold state for the preview
    private struct PreviewWrapper: View {
        @State private var selectedDate = Date()
        
        private let goalsManager = GoalsManager()
        private let healthManager = HealthManager()
        
        var body: some View {
            SecondaryMetrics(
                selectedDate: $selectedDate,
                goalsManager: goalsManager,
                healthManager: healthManager
            )
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
