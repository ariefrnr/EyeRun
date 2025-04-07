//
//  HealthManager.swift
//  EyeRun
//
//  Created by Jonathan Tjahjadi on 07/04/25.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject{
    
    let healthStore = HKHealthStore()
    
    init() {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch{
                print("error fetching health data")
            }
            
        }
        
    }
}
