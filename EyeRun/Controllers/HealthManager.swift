import HealthKit
import SwiftUI

class HealthManager: ObservableObject {
    private let healthStore = HKHealthStore()
    @Published var currentHeartRate: Double?
    @Published var currentCalories: Int?
    @Published var activeMinutes: Int?
    @Published var stepCount: Int?
    @Published var distanceTraveled: Double?
    @Published var lastReadingDate: Date?
    var error: Error?
    
    func fetchBatchActivitySummary() async throws -> [HKActivitySummary] {
        let calendar = Calendar(identifier: .gregorian)
        
        var startComponents = calendar.dateComponents([.day, .month, .year], from: Date())
        startComponents.calendar = calendar
        
        var endComponents = startComponents
        endComponents.calendar = calendar
        endComponents.day = 1 + (endComponents.day ?? 0)
        
        let predicate = HKQuery.predicate(forActivitySummariesBetweenStart: startComponents, end: endComponents)
        let descriptor = HKActivitySummaryQueryDescriptor(predicate: predicate)
        let summaries = try await descriptor.result(for: healthStore)
        
        return summaries
    }
    
//    func fetchLongRunningAnchoredObject(for quantityType: HKQuantityType) async throws -> Void {
//        let quantityType = HKQuantityType(quantityType)
//        
//        let anchor: HKQueryAnchor? = nil
//        let results: HKAncor
//    }
    
    func fetchHeartRate() {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            DispatchQueue.main.async {
                self.error = NSError(domain: "com.yourapp", code: 1,
                                     userInfo: [NSLocalizedDescriptionKey: "Heart rate type unavailable"])
            }
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
        ) { [weak self] _, samples, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error fetching heart rate: \(error.localizedDescription)")
                    self?.error = NSError(domain: "com.yourapp", code: 2,
                                          userInfo: [NSLocalizedDescriptionKey: error.localizedDescription])
                    self?.currentHeartRate = nil
                    return
                }

                guard let sample = samples?.first as? HKQuantitySample else {
                    self?.currentHeartRate = nil
                    self?.lastReadingDate = Date()
                    self?.error = NSError(domain: "com.yourapp", code: 3,
                                          userInfo: [NSLocalizedDescriptionKey: "No heart rate data available"])
                    return
                }

                let heartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
                self?.currentHeartRate = heartRate
                self?.lastReadingDate = Date()
                self?.error = nil
            }
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
        fetchHeartRate()
    }
}
