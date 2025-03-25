//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct StepsProgressView: View {
    var steps: Int = 1304
    var goals: Int = 10000
    
    var body: some View {
        ZStack {
            Circle()
                .frame(maxWidth: 220)
                .foregroundStyle(.white)
            
            VStack (spacing: 5) {
                Text("Steps")
                    .font(.largeTitle)
                    .bold()
                
                VStack {
                    Text("\(steps)")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("/\(goals)")
                        .font(.headline)
                        .bold()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .cornerRadius(2)
        .shadow(radius: 2)
    }
}

#Preview {
    StepsProgressView()
}
