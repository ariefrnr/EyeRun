//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct StepProgressView: View {
    var steps: Int
    var goal: Int

    var progress: CGFloat {
        return CGFloat(steps) / CGFloat(goal)
    }

    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                .rotationEffect(.degrees(-90))
            
            // Progress circle
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.orange, lineWidth: 15)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut(duration: 1), value: progress)

            // Step count text
            VStack {
                Text("Steps")
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                
                Text("\(steps.formatted(.number))")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)

                Text("/\(goal.formatted(.number))")
                    .font(.title3)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    StepProgressView(steps: 1500, goal: 5000)
}
