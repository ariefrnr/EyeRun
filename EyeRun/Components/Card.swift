//
//  Card.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 24/03/25.
//

import SwiftUI

struct StepsCard: View {
    let steps: CGFloat
    let goals: CGFloat
    let heartRate: Int
    let streak: Int
    var progress: CGFloat { steps / CGFloat(goals) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Steps")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(steps, specifier: "%.0f")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("/ \(goals, specifier: "%.0f")")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(0.7)
            }
            
            ProgressView(value: progress)
                .frame(maxWidth: .infinity, maxHeight: 10)
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
        .frame(maxHeight: 200)
        .background(Color.customizedBlue)
        .cornerRadius(15)
            
        
        
        VStack(alignment: .leading, spacing:0) {
            Text("Heart Rate")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(heartRate)")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            VStack{
                Text("bpm")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
        }
        .padding()
        .frame(maxHeight: 200)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("HeartRateRed"))
        .cornerRadius(15)
        
        VStack(alignment: .leading, spacing:0) {
            Text("I'm on a")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(streak)")
                    .font(.system(size: 56))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
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
        .frame(maxHeight: 200)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("StreakPurple"))
        .cornerRadius(15)
    }
        
}

#Preview {
    StepsCard(steps: 1304, goals: 10000, heartRate: 96, streak: 23)
}
