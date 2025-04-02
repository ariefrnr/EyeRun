//
//  GoalsModalView.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 27/03/25.
//

import SwiftUI

enum GoalType {
    case steps
    case distance
    case movement
    case calories
}

struct GoalsModalView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentGoal: GoalType = .steps
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Set Your Daily")
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                    Text(goalType)
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                
                goalSetter
                
                Spacer()
    
                Button(action: {
                    goToNextGoal()
                }) {
                    HStack {
                        Text(isLastGoal ? "Save Goals" : "Set Next Goals")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        
                        Image(systemName: isLastGoal ? "flag.pattern.checkered" : "chevron.right")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customizedOrange)
                    .cornerRadius(25)
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
            .animation(.default, value: currentGoal)
        }
    }
    
    private var goalType: String {
        switch currentGoal {
        case .steps:
            return "Steps Goals"
        case .distance:
            return "Distance Goals"
        case .movement:
            return "Movement Goals"
        case .calories:
            return "Calories Burned Goals"
        }
    }
    
    private var isLastGoal: Bool {
        return currentGoal == .calories
    }
    
    private var goalSetter: some View {
        switch currentGoal {
        case .steps:
            return AnyView(GoalsSteps())
        case .distance:
            return AnyView(GoalsDistance())
        case .movement:
            return AnyView(GoalsMinutes())
        case .calories:
            return AnyView(GoalsCalories())
        }
    }
    
    private func goToNextGoal() {
        switch currentGoal {
        case .steps:
            currentGoal = .distance
        case .distance:
            currentGoal = .movement
        case .movement:
            currentGoal = .calories
        case .calories:
            dismiss()
        }
    }
}

#Preview {
    GoalsModalView()
}
