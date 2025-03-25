//
//  SegmentedControls.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 25/03/25.
//

import SwiftUI

struct SegmentedControls: View{
    enum Period {
        case daily, weekly, monthly
    }
    
    @Binding var selectedPeriod: Period
    
    var body: some View {
        HStack(spacing: 0){
            Text("Daily")
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedPeriod == .daily ? Color.horizontalButton : Color.clear)
                .foregroundColor(selectedPeriod == .daily ? .white : .black)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedPeriod = .daily
                    }
                }
            Text("Weekly")
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedPeriod == .weekly ? Color.horizontalButton : Color.clear)
                .foregroundColor(selectedPeriod == .weekly ? .white : .black)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedPeriod = .weekly
                    }
                }
            Text("Monthly")
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedPeriod == .monthly ? Color.horizontalButton : Color.clear)
                .foregroundColor(selectedPeriod == .monthly ? .white : .black)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedPeriod = .monthly
                    }
                }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    SegmentedControls(selectedPeriod: .constant(.daily))
}
