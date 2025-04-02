//
//  Card.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 24/03/25.
//

import SwiftUI

struct HeartRateCard: View {
    let heartRate: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("Heart Rate")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(heartRate)")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            VStack{
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
    @StateObject private var controller = StepsController(deviceType: .simulator)
    
    let goals: CGFloat
    var progress: CGFloat { CGFloat(controller.steps) / CGFloat(goals) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Steps")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(controller.steps, specifier: "%.0f")")
                    .font(.system(size: 42))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("/ \(goals, specifier: "%.0f")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.bottom)
            .padding(.leading, 5)
        
            
            ProgressView(value: progress)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .background(Color.white.opacity(0.3))
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width * CGFloat(progress))
                            .cornerRadius(5)
                            
                    },
                    alignment: .leading
                )
                .cornerRadius(3)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customizedBlue)
        .cornerRadius(15)
    }
        
}

struct DistanceCard: View {
    let distance: CGFloat
    let goals: CGFloat
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
    let pace: String
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("Pace")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(pace)")
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding(.top)
            VStack{
                Text("/kilometers")
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
    let calories: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Calories")
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()

            VStack(alignment: .leading) {
                Text("\(calories)")
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


//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var stepsController = StepsController(deviceType: .simulator)
//    
//    var body: some View {
//        VStack {
//            Text("Today's Steps: \(stepsController.steps)")
//                .font(.title)
//                .padding()
//            
//            Button(action: {
//                do {
//                    try stepsController.startRealTimeStepCounting()
//                } catch {
//                    print("Error: \(error)")
//                }
//            }) {
//                Text("Start Record")
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(stepsController.isRealTimeActive ? Color.gray : Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .disabled(stepsController.isRealTimeActive)
//            
//            Button(action: {
//                do {
//                    try stepsController.stopRealTimeStepCounting()
//                } catch {
//                    print("Error: \(error)")
//                }
//            }) {
//                Text("Stop Record")
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(stepsController.isRealTimeActive ? Color.blue : Color.gray)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .disabled(!stepsController.isRealTimeActive)
//        }
//        .padding()
//        .onAppear {
//            do {
//                try stepsController.fetchDailySteps()
//            } catch {
//                print("Error: \(error)")
//            }
//        }
//    }
//}

#Preview {
    ScrollView{
        StepsCard(goals: 10000)
        HeartRateCard(heartRate: 90)
        StreakCard(streak: 90)
        DistanceCard(distance: 3.7, goals: 5)
        PaceCard(pace: "43:28")
        CaloriesCard(calories: 239)
        CadenceCard(cadence: 75)
        SpeedCard(speed: 6.6)
    }
}
