//
//  SegmentedControls.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 25/03/25.
//

import SwiftUI

struct SegmentedControls: View {
    enum Period: String, CaseIterable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
    }
    
    @State private var selectedPeriod: Period = .daily
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Period.allCases, id: \.self) { period in
                Text(period.rawValue)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedPeriod == period ? Color.customizedOrange : Color.clear)
                    .foregroundColor(selectedPeriod == period ? .white : .black)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedPeriod = period
                        }
                    }
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    SegmentedControls()
}
