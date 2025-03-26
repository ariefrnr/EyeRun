//
//  DateView.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        VStack {
            SegmentedControls(type: .other)
            DatePicker()
        }
    }
}


#Preview {
    DateView()
}
