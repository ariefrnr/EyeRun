//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct DistanceProgress: View {
    var distance = 3
    var GoalsDistance = 5
    
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
            Text("/\(GoalsDistance) km")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MovementProgress: View {
    var activeMinutes = 30
    var activeMinutesGoals = 45
    
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
            Text("/\(activeMinutesGoals) min")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct CaloriesProgress: View {
    var caloriesBurned = 189
    var caloriesBurnedGoals = 450
    
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
            
            Text("/\(caloriesBurnedGoals) kcal")
                .font(.subheadline)
                .opacity(0.6)
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainMetrics: View {
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
}
