//
//  Gauge.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct StepsProgress: View {
    var steps: Int = 1304
    var goals: Int = 10000
    
    var body: some View {
        ZStack {
            Circle()
                .frame(
                    minWidth: 80,
                    maxWidth: 100,
                    minHeight: 80,
                    maxHeight: 100
                )
                .foregroundColor(Color(.systemBackground))
                .shadow(radius: 2)

            VStack(spacing: 5) {
                Text("Steps")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary) // Adaptasi dengan mode terang/gelap
                
                VStack {
                    Text("\(steps)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("/\(goals)")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary) // Warna lebih redup untuk info tambahan
                }
            }
            .multilineTextAlignment(.center)
            .dynamicTypeSize(.large ... .xxLarge) // Mendukung ukuran font besar untuk aksesibilitas
        }
        .padding(8)
    }
}

#Preview {
    StepsProgress()
}
