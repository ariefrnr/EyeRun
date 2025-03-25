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
//                    .border(.black, width: 2)
                
                VStack {
                    Text("\(steps)")
                        .font(.largeTitle)
                        .bold()
//                        .border(.black, width: 2)
                    
                    Text("/\(goals)")
                        .font(.headline)
                        .bold()
//                        .border(.black, width: 2)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .border(.black, width: 2)
        }
        .padding()
        .cornerRadius(2)
        .shadow(radius: 2)
    }
}

#Preview {
    StepsProgressView()
}
