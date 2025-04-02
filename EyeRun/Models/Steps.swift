//
//  StepCount.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 28/03/25.
//

import SwiftUI
import CoreMotion

class Steps: ObservableObject {
    // Property or Attribute
    @Published var steps: Int = 0
    
    private let pedometer: CMPedometer
    
    // Constructor
    init(pedometer: CMPedometer) {
        self.pedometer = pedometer
    }
    
    // Gets Daily Steps Count
    func dailySteps(completion: @escaping (Int) -> Void) {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)

        pedometer.queryPedometerData(from: startOfDay, to: now) { data, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ Error fetching step count: \(error.localizedDescription)")
                    completion(0)
                } else if let data = data {
                    completion(data.numberOfSteps.intValue) // Mengembalikan jumlah langkah
                }
            }
        }
    }
    
    // Gets Real Time Steps
    func realTimeSteps(completion: @escaping (Int) -> Void) {
        self.pedometer.startUpdates(from: Date()) { data, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Pedometer error: \(error.localizedDescription)")
                } else if let data = data {
                    completion(data.numberOfSteps.intValue)
                }
            }
        }
    }
    
    // Stop Real Time Steps
    func stopRealTimeSteps() { self.pedometer.stopUpdates() }
}
