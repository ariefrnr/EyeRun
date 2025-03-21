//
//  Button.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct HorizontalButton: View {
    let color: Color
    
    var body: some View {
        Button(action: {
            print("Button Tapped!")
        }) {
            Text("Start Running")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity) // Mengisi seluruh lebar yang tersedia
                .padding()
                .background(color)
                .cornerRadius(25)
        }
        .padding(.horizontal)
        
    }
}

//#Preview {
//    HorizontalButton()
//}
