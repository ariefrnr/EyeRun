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
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .cornerRadius(25)
        }
        .padding(.horizontal)
        
    }
}

struct StopButton: View {
    @State private var isPressed = false
    
    var body: some View {
        Button {
            print("Stop button pressed!")
            isPressed.toggle()
        } label: {
            Text("STOP")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                .background(Color.horizontalButton)
                .clipShape(Circle()) // paksa jadi circle
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .animation(.spring(), value: isPressed)
        }
    }
}

struct DownloadButton: View {
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            print("Download button pressed!")
            isPressed.toggle()
        }) {
            Image (systemName: "square.and.arrow.up")
                .font(.system(size: 85, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                .padding(.bottom, 10)
                .background(Color.horizontalButton)
                .clipShape(Circle())
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .animation(.spring(), value: isPressed)
        }
    }
}

#Preview {
    HorizontalButton(color: .horizontalButton)
    StopButton()
    DownloadButton()
}
