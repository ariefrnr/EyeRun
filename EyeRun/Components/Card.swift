//
//  Card.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 24/03/25.
//

import SwiftUI
import UserNotifications

struct HeartRateCard: View {
    var heartRate: Double?  // Make it optional
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Heart Rate")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text(heartRate != nil ? "\(Int(heartRate!))" : "--")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            VStack {
                Text("bpm")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("HeartRateRed"))
        .cornerRadius(15)
    }
}

struct StreakCard: View {
    let streak: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("I'm on a")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(streak)")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing:0){
                Text("day running")
                    .font(.title2)
                    .foregroundColor(.white)
                Text("Streak")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("StreakPurple"))
        .cornerRadius(15)
    }
}

struct StepsCard: View {
    let steps: Int
    @EnvironmentObject var goalsManager: GoalsManager
    @EnvironmentObject var healthManager: HealthManager

    @State private var refreshTimer: Timer?

    var progress: CGFloat {
        CGFloat(steps) / CGFloat(goalsManager.userGoals.stepsGoal)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Steps")
                .font(.title)
                .bold()
                .foregroundColor(.white)

            Spacer()

            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(steps)")
                    .font(.system(size: 42))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)

            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("/ \(goalsManager.userGoals.stepsGoal)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
            .padding(.leading, 5)

            ProgressView(value: min(progress, 1.0))
                .frame(maxWidth: .infinity, maxHeight: 20)
                .background(Color.white.opacity(0.3))
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.white)
                            .cornerRadius(5)
                    },
                    alignment: .leading
                )
                .cornerRadius(3)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.customizedBlue)
        .cornerRadius(15)
        .onAppear {
            goalsManager.handleStepsReminder(steps: steps)
        }
        .onDisappear {
            refreshTimer?.invalidate()
        }
    }
}

struct DistanceCard: View {
    let distance: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Distance")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            Image (systemName: "figure.run")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .padding(.top)
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(distance, specifier: "%.1f")")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("km")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.distancePurple)
        .cornerRadius(15)
    }
        
}

struct PaceCard: View {
    let paceInMinutesPerKm: Double
    
    var paceText: String {
        guard paceInMinutesPerKm > 0 else { return "--" }

        let totalSeconds = Int(paceInMinutesPerKm * 60)

        if totalSeconds < 60 {
            return "\(totalSeconds) s"
        } else if totalSeconds < 3600 {
            let minutes = totalSeconds / 60
            return "\(minutes) m"
        } else if totalSeconds < 86400 {
            let hours = totalSeconds / 3600
            return "\(hours) h"
        } else {
            let days = totalSeconds / 86400
            return "\(days) day"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("Pace")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text(paceText)
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            VStack{
                Text("/Kilometer")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("PaceRed"))
        .cornerRadius(15)
    }
}

struct CaloriesCard: View {
    let calories: Double?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Calories")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()

            VStack(alignment: .leading) {
                Text("\(calories ?? 0, specifier: "%.0f")")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("kcal")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
            .padding(.top, 30)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.caloriesOrange)
        .cornerRadius(15)
    }
        
}

struct CadenceCard: View {
    let cadence: Int
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("Cadence")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(cadence)")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            VStack{
                Text("Steps/ Min")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color("CadenceCyan"))
        .cornerRadius(15)
    }
}

struct SpeedCard: View {
    let speed: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Speed")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()

            VStack(alignment: .leading, spacing: 5) {
                Text("\(speed, specifier: "%.1f")")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("km/h")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
            .padding(.top, 30)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(Color.speedYellow)
        .cornerRadius(15)
    }
        
}


#Preview {
    ScrollView{
        StepsCard(steps: HealthManager().stepCount ?? 0)
            .environmentObject(GoalsManager())
        HeartRateCard(heartRate: 90)
        StreakCard(streak: 90)
        DistanceCard(distance: 3.7)
        PaceCard(paceInMinutesPerKm: 100.3)
        CaloriesCard(calories: 239)
        CadenceCard(cadence: 75)
        SpeedCard(speed: 6.6)
    }
}


