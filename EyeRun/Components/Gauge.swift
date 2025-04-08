//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct DistanceProgress: View {
    var distance: Double
    @EnvironmentObject var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Distance Traveled")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text(String(format: "%.2f", distance ?? 0))
                .font(.system(size: 32))
                .fontWeight(.bold)
            Text("/\(Int(goalsManager.userGoals.distanceGoal)) km")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MovementProgress: View {
    var activeMinutes = 30
    @EnvironmentObject var goalsManager: GoalsManager
    
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
    @EnvironmentObject var goalsManager: GoalsManager
    
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
    @EnvironmentObject var goalsManager: GoalsManager
    @EnvironmentObject var healthManager: HealthManager
    var body: some View {
        VStack(alignment: .center){
            DistanceProgress(distance: healthManager.distanceTraveled ?? 0)
                .padding()
            Divider()
                .background(Color.black.opacity(1))
            MovementProgress(activeMinutes: healthManager.activeMinutes ?? 0)
                .padding()
            Divider()
                .background(Color.black.opacity(0.8))
            CaloriesProgress(caloriesBurned: Double(healthManager.currentCalories ?? 0))
           
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .onAppear(){
            healthManager.fetchCaloriesData()
            healthManager.fetchActiveMinutes()
            healthManager.fetchWalkingRunningDistance()
        }
    }
}

#Preview {
    MainMetrics()
}
