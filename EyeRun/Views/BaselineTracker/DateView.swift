//
//  DateView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct DateView: View {
    @StateObject private var healthManager = HealthManager()
    @Binding var selectedDate: Date
    var body: some View {
        VStack {
            SegmentedControls(type: .other)
            DatePicker(selectedDate: $selectedDate)
        }
        .environmentObject(healthManager)
    }
}
