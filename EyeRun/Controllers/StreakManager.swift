//
//  StreakManager.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 08/04/25.
//

import Foundation

class StreakManager: ObservableObject {
    @Published var currentStreak: Int = 0
    private var previousStreakDate: Date?
    func resetStreak(){
        currentStreak = 0
    }
    
    func checkUpdateStreak(healthManager: HealthManager, goalsManager: GoalsManager){
        if healthManager.stepCount ?? 0 >= goalsManager.userGoals.stepsGoal &&
            healthManager.distanceTraveled ?? 0 >= goalsManager.userGoals.distanceGoal &&
            Int(healthManager.currentCalories ?? 0) >= goalsManager.userGoals.caloriesGoal &&
            healthManager.activeMinutes ?? 0  >= goalsManager.userGoals.movementGoal {
            
            let currentDate = Date()
            let calendar = Calendar.current
            
            if let previosDate = previousStreakDate, calendar.isDate(previosDate, inSameDayAs: currentDate){
                return
            }
            
            previousStreakDate = currentDate
            currentStreak += 1
        } else {
            resetStreak()
        }
    }
    
    func getCurrentStreak() -> Int {
        return currentStreak
    }
}


