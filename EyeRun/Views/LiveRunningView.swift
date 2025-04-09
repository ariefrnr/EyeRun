//
//  LiveRunningView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct LiveRunningView: View {
    @StateObject private var locationManager = LocationManager()
    @State private var elapsedTime: Double = 0.0
    @State private var state: StopwatchState = .idle

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    StopwatchRun(
                        manager: locationManager,
                        elapsedTime: $elapsedTime,
                        state: $state
                    )
                    
                    LiveMetrics(manager: locationManager)
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
}

