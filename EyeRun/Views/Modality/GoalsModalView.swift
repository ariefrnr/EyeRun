//
//  GoalsModalView.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 27/03/25.
//


import SwiftUI

struct GoalsModalView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack{
                Text("Set Your Daily")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                Text("Steps Goals")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
            }
            .padding(.bottom, 20)
            
            GoalsSteps()
            
            Spacer()
            
            HorizontalButton(buttonName: "Set Next Goal")
                .padding()
            
            
        }
    }
}

#Preview {
    GoalsModalView()
}


