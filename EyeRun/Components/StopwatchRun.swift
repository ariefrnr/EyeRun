//
//  StopwatchRun.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 27/03/25.
//

import SwiftUI

struct SimpleTimerView: View {
    @State private var elapsedTime: Double = 0
    @State private var isRunning = true
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // Formatted time string
    var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            60
        }
        let tenths = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 10)
        
        return String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Time Display
            Text(formattedTime)
                .font(.system(size: 50, weight: .bold, design: .monospaced))
                .foregroundColor(.black)
            
            // Stop Button
            Button(action: {
                isRunning.toggle()
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .padding()
                    .background(isRunning ? Color.red.opacity(0.2) : Color.green.opacity(0.2))
                    .cornerRadius(10)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if isRunning {
                elapsedTime += 0.1
            }
        }
    }
}

// Preview
#Preview {
    SimpleTimerView()
}
