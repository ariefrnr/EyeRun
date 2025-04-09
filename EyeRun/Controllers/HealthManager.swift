import HealthKit
import SwiftUI

class HealthManager: NSObject, ObservableObject {
    private let healthStore = HKHealthStore()
    @Published var currentHeartRate: Double?
    @Published var currentCalories: Int?
    @Published var activeMinutes: Int?
    @Published var stepCount: Int?
    @Published var distanceTraveled: Double?
    @Published var lastReadingDate: Date?
    var isLoading = false
    var error: Error?
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
            let error = NSError(domain: "com.yourapp", code: 2, userInfo: [NSLocalizedDescriptionKey: "HealthKit not available"])
            DispatchQueue.main.async {
                self.error = error
                completion(false, error)
            }
            return
        }
        
        let readTypes: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            DispatchQueue.main.async {
                //                if success {
                //                    self.fetchHeartRate()
                //                }
                //                self.error = error
                //                completion(success, error)
                //                if success {
                //                    self.fetchCaloriesData()
                //                } else {
                //                    print("Authorization failed: \(error?.localizedDescription ?? "")")
                //                }
            }
        }
    }
    
    
    func fetchHeartRate() {
        isLoading = true
        
        getLatestHeartRate { [weak self] heartRate in
            DispatchQueue.main.async {
                self?.currentHeartRate = heartRate
                self?.lastReadingDate = Date()
                self?.isLoading = false
                
                if heartRate == nil {
                    self?.error = NSError(domain: "com.yourapp", code: 3,
                                          userInfo: [NSLocalizedDescriptionKey: "No heart rate data available"])
                }
            }
        }
    }
    
    func getLatestHeartRate(completion: @escaping (Double?) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }
        
        let now = Date()
        let startDate = Calendar.current.date(byAdding: .hour, value: -24 * 7, to: now)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(
            sampleType: heartRateType,
            predicate: predicate,
            limit: 100,
            sortDescriptors: [sortDescriptor]
        ) { _, samples, error in
            //            print(samples)
            if let error = error {
                print("Error fetching heart rate: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let sample = samples?.first as? HKQuantitySample else {
                completion(nil)
                return
            }
            
            let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            completion(heartRate)
        }
        
        healthStore.execute(query)
    }
    func fetchCaloriesData(for date: Date) {
        guard let activeEnergyType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            currentCalories = nil
            return
        }
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: endOfDay,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: activeEnergyType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { [weak self] _, result, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error fetching calories data: \(error.localizedDescription)")
                    self?.currentCalories = nil
                    return
                }
                
                guard let result = result, let sum = result.sumQuantity() else {
                    self?.currentCalories = nil
                    return
                }
                self?.currentCalories = Int(sum.doubleValue(for: HKUnit.kilocalorie()).rounded())
//                print("Calories sum: \(self?.currentCalories)")
            }
        }
        healthStore.execute(query)
    }   
    
    func fetchActiveMinutes(for date: Date) {
        guard let exerciseTimeType = HKQuantityType.quantityType(forIdentifier: .appleExerciseTime) else {
            return
        }
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: endOfDay,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: exerciseTimeType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { [weak self] _, result, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let error = error {
                    print("Error fetching active minutes: \(error.localizedDescription)")
                    return
                }
                
                guard let result = result, let sum = result.sumQuantity() else {
                    self.activeMinutes = nil
                    return
                }
                
                // Convert to minutes (HealthKit stores in seconds)
                let minutes = Int(sum.doubleValue(for: HKUnit.minute()))
                self.activeMinutes = minutes
                print("Fetched \(minutes) active minutes")
            }
        }
        
        healthStore.execute(query)
    }
    func fetchWalkingRunningDistance(for date: Date) {
        guard let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            return
        }
        
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: endOfDay,
            options: .strictStartDate
        )
        
        
        let query = HKStatisticsQuery(
            quantityType: distanceType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { [weak self] _, result, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let error = error {
                    print("Error fetching walking/running distance: \(error.localizedDescription)")
                    return
                }
                
                if let sum = result?.sumQuantity() {
                    let distanceInKm = sum.doubleValue(for: HKUnit.meterUnit(with: .kilo))
                    self.distanceTraveled = distanceInKm > 0 ? distanceInKm : nil
                } else {
                    self.distanceTraveled = nil
                }
                
                self.lastReadingDate = date
                print("Walking/Running distance: \(self.distanceTraveled ?? 0) km")
            }
        }
        
        healthStore.execute(query)
    }
    
    
    
    
    func fetchStepCount(for date: Date) {
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: endOfDay,
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { [weak self] _, result, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if let error = error {
                    print("Error fetching step count: \(error.localizedDescription)")
                    return
                }
                
                guard let result = result, let sum = result.sumQuantity() else {
                    self.stepCount = nil
                    return
                }
                
                self.stepCount = Int(sum.doubleValue(for: HKUnit.count()))
                print("Fetched \(self.stepCount ?? 0) steps for \(date)")
            }
        }
        
        healthStore.execute(query)
    }
    
    func fetchAllMetrics(for date: Date) {
        fetchCaloriesData(for: date)
        fetchStepCount(for: date)
        fetchActiveMinutes(for: date)
        fetchWalkingRunningDistance(for: date)
    }
}
