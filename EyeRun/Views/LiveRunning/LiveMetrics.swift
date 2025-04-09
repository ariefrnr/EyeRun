//
//  LiveMetrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 27/03/25.
//

import SwiftUI

struct LiveMetrics: View {
    @ObservedObject var manager: LocationManager
    
    var body: some View {
        HStack {
            VStack {
                DistanceCard(distance: manager.distance)
                PaceCard(paceInSecondsPerKm: manager.pace * 1000)
                CadenceCard(cadence: 75)
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
    var locationManager = LocationManager()
    
    LiveMetrics(manager: locationManager)
}
