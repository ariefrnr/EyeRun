//
//  LiveRunningView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct LiveRunningView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Stopwatch
                    Stopwatch()
                        .padding()
                    
                    // Metrics
                    LiveMetrics()
                        .padding()
                }
            }
            .navigationTitle("Live Running")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    LiveRunningView()
}
