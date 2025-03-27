//
//  Statistic.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI
import Charts

let stepsData: [StepData] = [
    StepData(day: "Mon", steps: 1200),
    StepData(day: "Tue", steps: 900),
    StepData(day: "Wed", steps: 1100),
    StepData(day: "Thu", steps: 4500),
    StepData(day: "Fri", steps: 1300),
    StepData(day: "Sat", steps: 1800),
    StepData(day: "Sun", steps: 1800),
]

struct AverageStat: View {
    var features = ["Steps", "Heart Rate", "Speed", "Distance"]
    @State private var selectedFeature: String = "Steps"
    private let averageSteps: Int = 1000
    
    var body: some View {
        VStack(alignment: .leading) {
            Color.blue
            
            SegmentedControls(type: .chart)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Average time")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack {
                    Text("\(averageSteps)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("steps")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            // Chart
            Color.customizedDarkGreen
                .foregroundStyle(.white)
                .cornerRadius(20)
                .padding(.horizontal)
        }
        .background(Color.brandSecondary)
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    AverageStat()
}
