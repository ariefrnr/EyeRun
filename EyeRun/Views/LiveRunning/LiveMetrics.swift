//
//  LiveMetrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 27/03/25.
//

import SwiftUI

struct LiveMetrics: View {
    var body: some View {
        HStack {
            VStack {
                DistanceCard(distance: 3.7, goals: 5)
                PaceCard(pace: "43:28")
                    .frame(height: 300)
                CadenceCard(cadence: 75)
                    .frame(height: 200)
                

            }
            
            VStack {
                HeartRateCard(heartRate: 90)
                    .frame(height: 200)
                CaloriesCard(calories: 239)
                SpeedCard(speed: 6.6)
            }
        }
    }
}


#Preview {
    LiveMetrics()
}
