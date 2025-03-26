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
                    Color.blue
                        .padding(.horizontal)
                    
                    HStack {
                        Color.green
                        Color.red
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        VStack {
                            Color.purple
                            Color.orange
                            Color.brandSecondary
                        }
                        
                        VStack {
                            Color.red
                            Color.customizedOrange
                            Color.yellow
                        }
                    }
                    .padding(.horizontal)
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
