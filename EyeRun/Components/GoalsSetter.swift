//
//  GoalsSetting.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 26/03/25.
//

import SwiftUI

struct GoalsSteps: View {
    @State private var stepsGoals = 11000
    
    var body: some View {
        
        HStack{
            Button(action: {
                print("button pressed")
                if stepsGoals > 0 {
                    stepsGoals -= 1000
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
                Text("\(stepsGoals)")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("steps")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                print("button pressed")
                stepsGoals += 1000
                
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

struct GoalsDistance : View {
    @State private var distanceGoals = 5
    
    var body: some View {
        HStack{
            Button(action: {
                print("button pressed")
                if distanceGoals > 0 {
                    distanceGoals -= 1
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
                Text("\(distanceGoals)")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("kilometers")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                print("button pressed")
                distanceGoals += 1
                
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

struct GoalsMinutes : View {
    @State private var activeMinutesGoals = 30
    
    var body: some View {
        HStack{
            Button(action: {
                print("button pressed")
                if activeMinutesGoals > 0 {
                    activeMinutesGoals -= 5
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
                Text("\(activeMinutesGoals)")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("minutes")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                print("button pressed")
                activeMinutesGoals += 5
                
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

struct GoalsCalories : View {
    @State private var caloriesBurnedGoals = 400
    
    var body: some View {
        HStack{
            Button(action: {
                print("button pressed")
                if caloriesBurnedGoals > 0 {
                    caloriesBurnedGoals -= 10
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
                Text("\(caloriesBurnedGoals)")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color.brandSecondary)
                Text("kcal")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .opacity(0.5)
            }
            Spacer()
            
            Button(action: {
                print("button pressed")
                caloriesBurnedGoals += 10
                
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

#Preview {
    GoalsDistance()
    GoalsSteps()
    GoalsMinutes()
    GoalsCalories()
}
