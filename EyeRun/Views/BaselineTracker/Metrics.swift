//
//  Metrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct PrimaryMetrics: View {
    @State private var selectedDate = Date()
    var body: some View {
        HStack {
            Image(systemName: "figure.run")
                .resizable()
                .frame(width: 200, height: 350)
                .padding()
            
            MainMetrics(selectedDate: $selectedDate)
                .environmentObject(HealthManager())
        }
    }
}

struct SecondaryMetrics: View {
    @State private var showModal = false
    @EnvironmentObject var goalsManager: GoalsManager
    @EnvironmentObject var healthManager: HealthManager
    @StateObject private var streakManager = StreakManager()
    @Binding var selectedDate: Date
    @State var timer: Timer?
    
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
                fetchDataStreak()
                autoRefreshOn()
            }
            .onDisappear(){
                autoRefreshOff()
            }
            
//            .onChange(of: selectedDate) {
//                newDate in
//                print("date changed to: \(newDate)")
//                healthManager.fetchStepCount(for: newDate)
//            }
            

        }
        

    }
    

    private func fetchDataStreak() {
        let currentDate = Date()
        healthManager.fetchHeartRate()
//        healthManager.fetchHeartRate(for: currentDate)
        healthManager.fetchStepCount(for: currentDate)
        healthManager.fetchCaloriesData(for: currentDate)
        healthManager.fetchActiveMinutes(for: currentDate)
        healthManager.fetchWalkingRunningDistance(for: currentDate)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            
            streakManager.checkAndUpdateStreak(healthManager: healthManager, goalsManager: goalsManager)
        }
    }
//    private func fetchDataStreak() {
//        healthManager.fetchHeartRate()
//        healthManager.fetchStepCount(for: selectedDate)
//        healthManager.fetchCaloriesData()
//        healthManager.fetchActiveMinutes()
//        healthManager.fetchWalkingRunningDistance()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
//            
//            streakManager.checkAndUpdateStreak(healthManager: healthManager, goalsManager: goalsManager)
//        }
//    }
    
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

//#Preview {
//    //    PrimaryMetrics()
//    
//    SecondaryMetrics(selectedDate: $selectedDate)
//        .environmentObject(GoalsManager())
//}
