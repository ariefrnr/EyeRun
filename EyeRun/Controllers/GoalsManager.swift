//
//  GoalsManager.swift
//  EyeRun
//

import Foundation
import SwiftUI

// Data model for user goals
struct UserGoals: Codable {
    var stepsGoal: Int
    var distanceGoal: Double // in kilometers/miles
    var movementGoal: Int // in minutes
    var caloriesGoal: Int
    
    static let defaultGoals = UserGoals(
        stepsGoal: 2000,
        distanceGoal: 2.0,
        movementGoal: 30,
        caloriesGoal: 400
    )
}

// Manager class to handle saving and loading goals
class GoalsManager: ObservableObject {
    @Published var userGoals: UserGoals
    
    private let userDefaults = UserDefaults.standard
    private let goalsKey = "userGoals"
    
    init() {
        // Try to load saved goals, or use default if none exist
        if let savedGoalsData = userDefaults.data(forKey: goalsKey),
           let decodedGoals = try? JSONDecoder().decode(UserGoals.self, from: savedGoalsData) {
            self.userGoals = decodedGoals
        } else {
            self.userGoals = UserGoals.defaultGoals
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
