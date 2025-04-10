import Foundation

class StreakManager: ObservableObject {
    @Published var currentStreak: Int = 0
    private var previousStreakDate: Date?
    
    // Function to check if the user met their goals today
    func checkAndUpdateStreak(healthManager: HealthManager, goalsManager: GoalsManager) {
        // Check if all goals are met (progress >= goal)
        let isGoalMet = healthManager.stepCount ?? 0 >= goalsManager.userGoals.stepsGoal
        let isDistanceGoalMet = healthManager.distanceTraveled ?? 0 >= goalsManager.userGoals.distanceGoal
        let isCaloriesGoalMet = healthManager.currentCalories ?? 0 >= goalsManager.userGoals.caloriesGoal
        let isMovementGoalMet = healthManager.activeMinutes ?? 0 >= goalsManager.userGoals.movementGoal
        
        
        // Only proceed if all goals are met
        if isGoalMet && isDistanceGoalMet && isCaloriesGoalMet && isMovementGoalMet {
            let currentDate = Date()
            let calendar = Calendar.current
            
            // Check if it's the same day as the previous streak date
            if let previousDate = previousStreakDate,
               calendar.isDate(previousDate, inSameDayAs: currentDate) {
                // If the streak date is today, no need to increment the streak
                return
            }
            
            // Update previous streak date to today
            previousStreakDate = currentDate
            
            // Increment the streak
            currentStreak += 1
        } else {
            // Reset streak if goals are not met
            currentStreak = 0
        }
    }
    
    
    func getCurrentStreak() -> Int {
        return currentStreak
    }
}


