//
//  DateView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct DateView: View {
    @StateObject private var healthManager = HealthManager()
//    @State private var selectedDate = Date()
    @Binding var selectedDate: Date
    var body: some View {
        VStack {
            SegmentedControls(type: .other)
            DatePicker(selectedDate: $selectedDate)
//                .onChange(of: selectedDate) {
//                    newDate in
//                    healthManager.fetchStepCount(for: newDate)
//                    healthManager.fetchHeartRate()
//                    healthManager.fetchCaloriesData(for: newDate)
//                    healthManager.fetchActiveMinutes(for: newDate)
//                    healthManager.fetchWalkingRunningDistance(for: newDate)
//                }
        }
        .environmentObject(healthManager)
    }
}


//#Preview {
//    DateView()
//}
