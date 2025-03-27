//
//  Dropdown.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 26/03/25.
//

import SwiftUI

struct DropDownMenu: View {
    var features = ["Steps", "Heart Rate", "Speed", "Distance"]
    @State private var selectedFeature: String = "Steps"

    var body: some View {
        VStack {
            Picker("features", selection: $selectedFeature) {
                ForEach(features, id: \.self) { feature in
                    Text(feature)
                        .foregroundColor(.white) // Pastikan teks di dalam dropdown tetap putih
                }
            }
            .pickerStyle(.menu) // Menggunakan tampilan dropdown menu
            .tint(.white) // Warna teks utama menjadi putih
            .labelsHidden() // Menyembunyikan label "features"
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .border(.black, width: 2)
    }
}

#Preview {
    DropDownMenu()
}
