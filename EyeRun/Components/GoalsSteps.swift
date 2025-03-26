//
//  GoalsSetting.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 26/03/25.
//

import SwiftUI

struct GoalsSteps: View {
    @State private var steps = 10000
    
    var body: some View {
        
        HStack{
            Button(action: {
                print("button pressed")
                if steps > 0 {
                    steps -= 1000
                }
            }){
                Image(systemName: "minus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.horizontalButton)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
            Spacer()
            
            
            VStack{
                Text("\(steps)")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("Steps")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                print("button pressed")
                steps += 1000
                
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.horizontalButton)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    GoalsSteps()
}
