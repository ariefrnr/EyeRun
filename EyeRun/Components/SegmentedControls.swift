//
//  SegmentedControls.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 25/03/25.
//

import SwiftUI

struct SegmentedControls: View {
    @State private var selectedPeriod: Period = .daily
    private var isChart: Bool { type == .chart }
    let type: ControlType
    
    enum Period: String, CaseIterable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
    }
    
    enum ControlType {
            case chart
            case other
        }
        
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(Period.allCases, id: \.self) { period in
                    Text(period.rawValue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            selectedPeriod == period ? (
                                isChart ? Color.customizedCyan : Color.customizedOrange
                            ) : Color.clear
                        )
                        .cornerRadius(12)
                        .foregroundStyle(isChart ? Color.white : (
                            selectedPeriod == period ? Color.white : Color.primary
                        ))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedPeriod = period
                            }
                        }
                        .fontWeight(selectedPeriod == period ? .bold : .regular)
                }
                .padding(4)
            }
            .background(isChart ? Color.customizedDarkGreen : Color.customizedGray.opacity(0.2))
            .cornerRadius(12)
        }
    }
}

#Preview {
    SegmentedControls(type: .chart)
}
