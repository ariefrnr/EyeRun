//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct StepsProgress: View {
    var distance = 3.7
    var GoalsDistance = 5
    
    var body: some View {
        ZStack {
            Circle()
                .frame(
                    minWidth: 80,
                    maxWidth: 100,
                    minHeight: 80,
                    maxHeight: 100
                )
                .foregroundColor(Color.white)
                .shadow(radius: 2)

            VStack(spacing: 5) {
                Text("Distance")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary) // Adaptasi dengan mode terang/gelap
                
                VStack {
                    Text("\(distance)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("/\(GoalsDistance)km")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary) // Warna lebih redup untuk info tambahan
                }
            }
            .multilineTextAlignment(.center)
            .dynamicTypeSize(.large ... .xxLarge) // Mendukung ukuran font besar untuk aksesibilitas
        }
        .padding(8)
    }
}



struct DistanceProgress: View {
    var distance = 3
    var GoalsDistance = 5
    
    var body: some View {
        VStack(alignment: .center){
            Text("Distance Traveled")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text("\(distance)")
                .font(.system(size: 56))
                .fontWeight(.bold)
            Text("/\(GoalsDistance) km")
                .font(.system(size: 20))
        }
        .frame(width: .infinity, height: 150)
    }
}

struct MovementProgress: View {
    var activeMinutes = 30
    var activeMinutesGoals = 45
    
    var body: some View {
        VStack(alignment: .center){
            Text("Active Minutes")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text("\(activeMinutes)")
                .font(.system(size: 56))
                .fontWeight(.bold)
            Text("/\(activeMinutesGoals) min")
                .font(.system(size: 20))
                .opacity(0.6)
        }
        .frame(width: .infinity, height: 150)
        
    }
}

struct CaloriesProgress: View {
    var caloriesBurned = 189
    var caloriesBurnedGoals = 450
    
    var body: some View {
        VStack(alignment: .center){
            
            Text("Calories Burned")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color.customizedOrange)
                .multilineTextAlignment(.center)
            Text("\(caloriesBurned)")
                .font(.system(size: 56))
                .fontWeight(.bold)
            Text("/\(caloriesBurnedGoals) kcal")
                .font(.system(size: 20))
                .opacity(0.6)
        }
        .frame(width: .infinity, height: 150)
        
    }
}

struct MainMetrics: View {
    
    
    var body: some View {
        VStack(alignment: .center){
            DistanceProgress()
                .padding(10)
            Divider()
                .background(Color.black.opacity(1))
            MovementProgress()
                .padding(10)
            Divider()
                .background(Color.black.opacity(0.8))
            CaloriesProgress()
                .padding(10)
        }
        .frame(width: 130)
        .padding(.vertical)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

#Preview {
    MainMetrics()
}
