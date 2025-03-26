//
//  Metrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct PrimaryMetrics: View {
    var body: some View {
        VStack {
            HStack {
                Color.green
                Color.gray
            }
            
            Color.red
        }
    }
}

struct SecondaryMetrics: View {
    var body: some View {
        HStack {
            VStack {
                Color.pink
                Color.orange
            }
            
            VStack {
                Color.purple
                Color.cyan
            }
        }
    }
}

#Preview {
//    PrimaryMetrics()
    SecondaryMetrics()
}
