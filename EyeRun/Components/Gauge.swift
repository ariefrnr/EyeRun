//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct DistanceProgress: View {
    var distance = 3
    @EnvironmentObject var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Distance Traveled")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text("\(distance)")
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
    var caloriesBurned = 189
    @EnvironmentObject var goalsManager: GoalsManager
    
    var body: some View {
        VStack(alignment: .center){
            Text("Calories Burned")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            
            Text("\(caloriesBurned)")
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
    
    var body: some View {
        VStack(alignment: .center){
            DistanceProgress()
                .padding()
            Divider()
                .background(Color.black.opacity(1))
            MovementProgress()
                .padding()
            Divider()
                .background(Color.black.opacity(0.8))
            CaloriesProgress()
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

#Preview {
    MainMetrics()
        .environmentObject(GoalsManager())
}
