//
//  File.swift
//  EyeRun
//
//  Created by Channo Adikara on 25/03/25.
//

import Foundation
import SwiftUI

struct StopButton: View {
    @State private var isPressed = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
            isPressed.toggle()
        }) {
            Text("STOP")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                .background(Color.horizontalButton) // Coral Orange matching previous recommendation
                .clipShape(Circle()) // paksa jadi circle
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .animation(.spring(), value: isPressed)
        }
    }
}


struct DownloadButton: View {
    @State private var isPressed = false
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
            isPressed.toggle()
        }) {
            Image (systemName: "square.and.arrow.up")
                .font(.system(size: 85, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                .padding(.bottom, 10)
                .background(Color.horizontalButton) // Coral Orange matching previous recommendation
                .clipShape(Circle()) // paksa jadi circle
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .animation(.spring(), value: isPressed)
        }
    }
}





// Example View to demonstrate usage
struct contentView: View {
    var body: some View {
        StopButton(action: {
            print("Stop button pressed!")
        })
        .padding()
    }
}


