//
//  UserGoals.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 05/04/25.
//

// Data model for user goals
struct Users: Codable {
    var stepsGoal: Int
    var distanceGoal: Double // in kilometers/miles
    var movementGoal: Int // in minutes
    var caloriesGoal: Int
    
    static let defaultGoals = Users(
        stepsGoal: 2000,
        distanceGoal: 2.0,
        movementGoal: 30,
        caloriesGoal: 400
    )
}
