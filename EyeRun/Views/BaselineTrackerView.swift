//
//  BaselineTrackerView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct BaselineTrackerView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Date
                    DateView()
                    
                    // Primary
                    PrimaryMetrics()
                    
                    // Secondary
                    SecondaryMetrics()
                    
                    // Average Stat
                    Color.indigo
                }
                .padding()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Activities Overview")
                        .font(.title)
                        .foregroundColor(Color(Color.horizontalButton))
                        .padding()
                }
            }
        }
    }
}


#Preview {
    BaselineTrackerView()
}
