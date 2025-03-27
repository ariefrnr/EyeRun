//
//  Button.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 21/03/25.
//

import SwiftUI

struct HorizontalButton: View {
    let buttonName: String
    @State private var isPressed = false
    
    var body: some View {
        Button {
            print("Stop button pressed!")
            isPressed.toggle()
        } label: {
            HStack{
                Text(buttonName)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                Image(systemName: "play.fill")
                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.customizedOrange)
            .cornerRadius(25)
            .animation(.spring(), value: isPressed)
        }
<<<<<<< HEAD
=======
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.customizedOrange)
        .cornerRadius(25)
>>>>>>> parent of 00cba21 (Merge pull request #38 from ariefrnr/jojo)
        
    }
}

struct StopButton: View {
    let buttonName: String
    @State private var isPressed = false
    
    var body: some View {
        Button {
            print("Stop button pressed!")
            isPressed.toggle()
        } label: {
            Text(buttonName)
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                .background(Color.customizedOrange)
                .clipShape(Circle())
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
                .background(Color.customizedOrange)
                .clipShape(Circle())
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                .animation(.spring(), value: isPressed)
        }
    }
}

#Preview {
    HorizontalButton(buttonName: "Start Running")
    StopButton(buttonName: "Stop Run")
    DownloadButton()
}
