//
//  GoalsModalView.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 27/03/25.
//


import SwiftUI

struct StepsGoalsModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Set Your Daily")
                        .font(.system(size: 38))
                        .fontWeight(.heavy)
                    Text("Steps Goals")
                        .font(.system(size: 38))
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                
                GoalsSteps()
                
                Spacer()
                
                
                NavigationLink(destination: DistanceGoalsModalView()) {
                    HStack{
                        Text("Set Next Goals")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        
                        
                        Image(systemName: "chevron.right")
                    }
                    .frame(width: .infinity)
                    .foregroundColor(.white)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customizedOrange)
                    .cornerRadius(25)
                        
//                    HorizontalButton(buttonName: "Set Next Goal", systemImageName: "chevron.right")
                }
                
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            .navigationTitle("Manage Goals")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct DistanceGoalsModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Set Your Daily")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                Text("Distance Goals")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            
            GoalsDistance()
            
            Spacer()
            
            NavigationLink(destination: MovementGoalsModalView()) {
                HStack{
                    Text("Set Next Goals")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                    
                    Image(systemName: "chevron.right")
                }
                .frame(width: .infinity)
                .foregroundColor(.white)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customizedOrange)
                .cornerRadius(25)
                    
//                    HorizontalButton(buttonName: "Set Next Goal", systemImageName: "chevron.right")
            }
            
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .navigationTitle("Manage Goals")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MovementGoalsModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Set Your Daily")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                Text("Movement Goals")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            
            GoalsMinutes()
            
            Spacer()
            
            NavigationLink(destination: CaloriesGoalsModalView()) {
                HStack{
                    Text("Set Next Goals")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                    
                    Image(systemName: "chevron.right")
                }
                .frame(width: .infinity)
                .foregroundColor(.white)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customizedOrange)
                .cornerRadius(25)
                    
//                    HorizontalButton(buttonName: "Set Next Goal", systemImageName: "chevron.right")
            }
            
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .navigationTitle("Manage Goals")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CaloriesGoalsModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Set Your Daily")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
                Text("Calories Burned Goals")
                    .font(.system(size: 38))
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 20)
            
            GoalsCalories()
            
            Spacer()
            
            
            NavigationLink(destination: BaselineTrackerView()) {
                HStack{
                    Text("Save Goals")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    
                    
                    Image(systemName: "flag.pattern.checkered")
                }
                .frame(width: .infinity)
                .foregroundColor(.white)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.customizedOrange)
                .cornerRadius(25)
                    
//                    HorizontalButton(buttonName: "Set Next Goal", systemImageName: "chevron.right")
            }
            
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .navigationTitle("Manage Goals")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StepsGoalsModalView()
    //    DistanceGoalsModalView()
}


