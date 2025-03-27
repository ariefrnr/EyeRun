//
//  LiveMetrics.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 27/03/25.
//

import SwiftUI

struct LiveMetrics: View {
    var body: some View {
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
    }
}


#Preview {
    LiveMetrics()
}
