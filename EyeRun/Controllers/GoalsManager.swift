//
//  GoalsManager.swift
//  EyeRun
//

import Foundation
import SwiftUI
import UserNotifications

class GoalsManager: ObservableObject {
    @Published var userGoals: Users

    private let userDefaults = UserDefaults.standard
    private let goalsKey = "userGoals"

    init() {
        if let savedData = userDefaults.data(forKey: goalsKey),
           let decoded = try? JSONDecoder().decode(Users.self, from: savedData) {
            self.userGoals = decoded
        } else {
            self.userGoals = Users.defaultGoals
        }

        requestNotificationPermission()
    }

    // MARK: - Save Goals
    private func saveGoals() {
        if let data = try? JSONEncoder().encode(userGoals) {
            userDefaults.set(data, forKey: goalsKey)
        }
    }

    // MARK: - Update Goals
    func updateStepsGoal(_ steps: Int) {
        userGoals.stepsGoal = steps
        saveGoals()
        scheduleInstantReminder(title: "Steps Goal", message: "Time to hit your step goal of \(steps) steps!")
    }

    func updateDistanceGoal(_ distance: Double) {
        userGoals.distanceGoal = distance
        saveGoals()
        scheduleInstantReminder(title: "Distance Goal", message: "Go crush your distance goal of \(distance) km!")
    }

    func updateMovementGoal(_ minutes: Int) {
        userGoals.movementGoal = minutes
        saveGoals()
        scheduleInstantReminder(title: "Movement Goal", message: "Move for at least \(minutes) minutes today!")
    }

    func updateCaloriesGoal(_ calories: Int) {
        userGoals.caloriesGoal = calories
        saveGoals()
        scheduleInstantReminder(title: "Calories Goal", message: "Burn \(calories) kcal today. You got this!")
    }

    // MARK: - Notification
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }

    private func scheduleInstantReminder(title: String, message: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error.localizedDescription)")
            }
        }
    }

    private func scheduleDailyReminder(id: String, title: String, message: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = .default

        var components = DateComponents()
        components.hour = 19 // 7 PM

        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Notification Error (\(id)): \(error.localizedDescription)")
            }
        }
    }

    private func cancelReminder(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }

    // MARK: - Goal Check Handlers
    func handleDistanceReminder(currentDistance: Double) {
        currentDistance < userGoals.distanceGoal
            ? scheduleDailyReminder(id: "distance_goal_reminder", title: "Keep Moving!", message: "You haven’t reached your distance goal yet. Let’s go! 💪")
            : cancelReminder(id: "distance_goal_reminder")
    }

    func handleStepsReminder(steps: Int) {
        steps < userGoals.stepsGoal
            ? scheduleDailyReminder(id: "steps_goal_reminder", title: "Steps Reminder", message: "You haven't reached your step goal today. Let's get moving! 🚶‍♂️")
            : cancelReminder(id: "steps_goal_reminder")
    }

    func handleAllReminders(distance: Double, minutes: Int, calories: Int) {
        var unmet: [String] = []
        if distance < userGoals.distanceGoal { unmet.append("Distance") }
        if minutes < userGoals.movementGoal { unmet.append("Active Minutes") }
        if calories < userGoals.caloriesGoal { unmet.append("Calories") }

        unmet.isEmpty
            ? cancelReminder(id: "daily_goal_reminder")
            : scheduleDailyReminder(
                id: "daily_goal_reminder",
                title: "Daily Goal Reminder",
                message: "You haven’t reached your goals for: \(unmet.joined(separator: ", ")). Let's finish strong! 💪"
            )
    }
}
