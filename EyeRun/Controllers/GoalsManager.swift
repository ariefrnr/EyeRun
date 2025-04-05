//
//  GoalsManager.swift
//  EyeRun
//

import Foundation
import SwiftUI

// Manager class to handle saving and loading goals
class GoalsManager: ObservableObject {
    @Published var userGoals: Users
    
    private let userDefaults = UserDefaults.standard
    private let goalsKey = "userGoals"
    
    init() {
        // Try to load saved goals, or use default if none exist
        if let savedGoalsData = userDefaults.data(forKey: goalsKey),
           let decodedGoals = try? JSONDecoder().decode(Users.self, from: savedGoalsData) {
            self.userGoals = decodedGoals
        } else {
            self.userGoals = Users.defaultGoals
        }
    }
    
    func saveGoals() {
        if let encodedData = try? JSONEncoder().encode(userGoals) {
            userDefaults.set(encodedData, forKey: goalsKey)
        }
    }
    
    func updateStepsGoal(_ steps: Int) {
        userGoals.stepsGoal = steps
        saveGoals()
    }
    
    func updateDistanceGoal(_ distance: Double) {
        userGoals.distanceGoal = distance
        saveGoals()
    }
    
    func updateMovementGoal(_ minutes: Int) {
        userGoals.movementGoal = minutes
        saveGoals()
    }
    
    func updateCaloriesGoal(_ calories: Int) {
        userGoals.caloriesGoal = calories
        saveGoals()
    }
}
