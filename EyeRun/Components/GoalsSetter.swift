//
//  GoalsSetting.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 26/03/25.
//

import SwiftUI

struct GoalsSteps: View {
    @Binding var stepsGoal: Int
    
    var body: some View {
        HStack{
            Button(action: {
                if stepsGoal > 0 {
                    stepsGoal -= 1000
                }
            }){
                Image(systemName: "minus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
            Spacer()
            
            VStack{
                Text("\(stepsGoal)")
                    .font(.system(size: 56))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("steps")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                stepsGoal += 1000
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

struct GoalsDistance: View {
    @Binding var distanceGoal: Double
    
    var body: some View {
        HStack{
            Button(action: {
                if distanceGoal > 0 {
                    distanceGoal -= 1.0
                }
            }){
                Image(systemName: "minus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
            Spacer()
            
            VStack{
                Text("\(Int(distanceGoal))")
                    .font(.system(size: 56))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("kilometers")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                distanceGoal += 1.0
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

struct GoalsMinutes: View {
    @Binding var movementGoal: Int
    
    var body: some View {
        HStack{
            Button(action: {
                if movementGoal > 0 {
                    movementGoal -= 5
                }
            }){
                Image(systemName: "minus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
            Spacer()
            
            VStack{
                Text("\(movementGoal)")
                    .font(.system(size: 56))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("minutes")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                movementGoal += 5
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

struct GoalsCalories: View {
    @Binding var caloriesGoal: Int
    
    var body: some View {
        HStack{
            Button(action: {
                if caloriesGoal > 0 {
                    caloriesGoal -= 10
                }
            }){
                Image(systemName: "minus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
            Spacer()
            
            VStack{
                Text("\(caloriesGoal)")
                    .font(.system(size: 56))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("kcal")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                caloriesGoal += 10
            }){
                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .frame(height: 60)
                    .padding(10)
                    .fontWeight(.heavy)
                    .background(Color.customizedOrange)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}

// Preview providers for each view
extension GoalsSteps {
    struct PreviewProvider: View {
        @State private var stepsGoal = 11000
        
        var body: some View {
            GoalsSteps(stepsGoal: $stepsGoal)
        }
    }
    
    static var preview: some View {
        PreviewProvider()
    }
}

extension GoalsDistance {
    struct PreviewProvider: View {
        @State private var distanceGoal = 5.0
        
        var body: some View {
            GoalsDistance(distanceGoal: $distanceGoal)
        }
    }
    
    static var preview: some View {
        PreviewProvider()
    }
}

extension GoalsMinutes {
    struct PreviewProvider: View {
        @State private var movementGoal = 30
        
        var body: some View {
            GoalsMinutes(movementGoal: $movementGoal)
        }
    }
    
    static var preview: some View {
        PreviewProvider()
    }
}

extension GoalsCalories {
    struct PreviewProvider: View {
        @State private var caloriesGoal = 400
        
        var body: some View {
            GoalsCalories(caloriesGoal: $caloriesGoal)
        }
    }
    
    static var preview: some View {
        PreviewProvider()
    }
}


