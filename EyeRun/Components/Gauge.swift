//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct DistanceProgress: View {
    var distance: Double
    var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Distance Traveled")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text(String(format: "%.2f", distance))
                .font(.system(size: 32))
                .fontWeight(.bold)
            Text("/\(Int(goalsManager.userGoals.distanceGoal)) km")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            goalsManager.handleDistanceReminder(currentDistance: distance)
        }
    }
}

struct MovementProgress: View {
    var activeMinutes: Int
    var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Active Minutes")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text("\(activeMinutes)")
                .font(.system(size: 32))
                .fontWeight(.bold)
            Text("/\(goalsManager.userGoals.movementGoal) min")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
    }
}

struct CaloriesProgress: View {
    var caloriesBurned: Double
    var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Active Calories")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            
            Text("\(Int(caloriesBurned))")
                .font(.system(size: 32))
                .fontWeight(.bold)
            
            Text("/\(goalsManager.userGoals.caloriesGoal) kcal")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainMetrics: View {
    var goalsManager: GoalsManager
    var healthManager: HealthManager
    @Binding var selectedDate: Date

    var body: some View {
        VStack(alignment: .center){
            DistanceProgress(distance: healthManager.distanceTraveled ?? 0, goalsManager: goalsManager)
                .padding()
            
            Divider()
                .background(Color.black.opacity(1))
            
            MovementProgress(activeMinutes: healthManager.activeMinutes ?? 0, goalsManager: goalsManager)
                .padding()
            
            Divider()
                .background(Color.black.opacity(0.8))
            
            CaloriesProgress(caloriesBurned: Double(healthManager.currentCalories ?? 0), goalsManager: goalsManager)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .onAppear {
            // Check for reminders after slight delay to ensure data is fetched
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                let distance = healthManager.distanceTraveled ?? 0
                let activeMinutes = healthManager.activeMinutes ?? 0
                let calories = healthManager.currentCalories ?? 0
                
                goalsManager.handleAllReminders(
                    distance: distance,
                    minutes: activeMinutes,
                    calories: calories
                )
            }
        }
    }
}


//#Preview {
//    MainMetrics(selectedDate: $selectedDate)
//}
