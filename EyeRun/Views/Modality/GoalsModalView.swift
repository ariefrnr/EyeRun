//
//  GoalsModalView.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 27/03/25.
//

import SwiftUI

struct GoalsModalView: View {
    enum GoalType {
        case steps
        case distance
        case movement
        case calories
    }
    
    @Environment(\.dismiss) private var dismiss
    @State private var currentGoal: GoalType = .steps
    @EnvironmentObject var goalsManager: GoalsManager
    
    // Keep track of temporary values
    @State private var tempStepsGoal: Int
    @State private var tempDistanceGoal: Double
    @State private var tempMovementGoal: Int
    @State private var tempCaloriesGoal: Int
    
    init() {
        // Use a temporary instance just for the initializer
        let tempManager = GoalsManager()
        _tempStepsGoal = State(initialValue: tempManager.userGoals.stepsGoal)
        _tempDistanceGoal = State(initialValue: tempManager.userGoals.distanceGoal)
        _tempMovementGoal = State(initialValue: tempManager.userGoals.movementGoal)
        _tempCaloriesGoal = State(initialValue: tempManager.userGoals.caloriesGoal)
    }
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
            .onAppear {
                // Update temporary values with current saved values
                tempStepsGoal = goalsManager.userGoals.stepsGoal
                tempDistanceGoal = goalsManager.userGoals.distanceGoal
                tempMovementGoal = goalsManager.userGoals.movementGoal
                tempCaloriesGoal = goalsManager.userGoals.caloriesGoal
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
                return AnyView(GoalsSteps(stepsGoal: $tempStepsGoal))
            case .distance:
                return AnyView(GoalsDistance(distanceGoal: $tempDistanceGoal))
            case .movement:
                return AnyView(GoalsMinutes(movementGoal: $tempMovementGoal))
            case .calories:
                return AnyView(GoalsCalories(caloriesGoal: $tempCaloriesGoal))
            }
        }
    
    private func goToNextGoal() {
            // Save the current goal before moving to next
            switch currentGoal {
            case .steps:
                goalsManager.updateStepsGoal(tempStepsGoal)
                currentGoal = .distance
            case .distance:
                goalsManager.updateDistanceGoal(tempDistanceGoal)
                currentGoal = .movement
            case .movement:
                goalsManager.updateMovementGoal(tempMovementGoal)
                currentGoal = .calories
            case .calories:
                goalsManager.updateCaloriesGoal(tempCaloriesGoal)
                dismiss()
            }
        }
    }


#Preview {
    GoalsModalView()
}
