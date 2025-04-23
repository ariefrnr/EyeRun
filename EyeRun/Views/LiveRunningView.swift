//
//  LiveRunningView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct LiveRunningView: View {
    
    
    @State private var elapsedTime: Double = 0.0
    @State private var state: StopwatchState = .idle
    
    private var locationManager = LocationManager()
    private var healthManager = HealthManager()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    StopwatchRun(
                        manager: locationManager,
                        elapsedTime: $elapsedTime,
                        state: $state
                    )
                    
                    LiveMetrics(manager: locationManager, healthManager: healthManager)
                }
                .padding()
            }
            .navigationTitle("Live Running")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LiveRunningView()
        .environmentObject(HealthManager())
}

