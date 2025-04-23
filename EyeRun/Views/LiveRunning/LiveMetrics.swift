//
//  LiveMetrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 27/03/25.
//

import SwiftUI

struct LiveMetrics: View {
    @ObservedObject var manager: LocationManager
    var healthManager: HealthManager
    
    var body: some View {
        HStack {
            VStack {
                DistanceCard(distance: manager.distance / 1000)
                PaceCard(paceInMinutesPerKm: manager.pace)
                CadenceCard(cadence: manager.cadence)
            }
            
            VStack {
                HeartRateCard(heartRate: healthManager.currentHeartRate ?? 0)
                    .frame(height: 300)
                CaloriesCard(calories: manager.calories)
                SpeedCard(speed: CGFloat(manager.speed))
            }
        }
    }
}

#Preview {
    LiveMetrics(manager: LocationManager(), healthManager: HealthManager())
}
