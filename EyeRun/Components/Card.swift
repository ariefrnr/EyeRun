//
//  Card.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 24/03/25.
//

import SwiftUI

struct Card: View {
    let distance: Double = 3.7
    let goals: Int = 5
    var progress: Double { distance / Double(goals) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Distance Traveled")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(alignment: .lastTextBaseline, spacing: 5) {
                Text("\(distance, specifier: "%.1f") km")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("/ \(goals) km")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(0.7)
            }
            
            ProgressView(value: progress)
                .frame(maxWidth: .infinity, maxHeight: 10)
                .background(Color.white.opacity(0.3))
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: geometry.size.width * CGFloat(progress))
                            .cornerRadius(5)
                    },
                    alignment: .leading
                )
                .cornerRadius(3)
        }
        .padding()
        .frame(maxHeight: 200)
        .background(Color.brandSecondary)
        .cornerRadius(15)
    }
}

#Preview {
    Card()
}
