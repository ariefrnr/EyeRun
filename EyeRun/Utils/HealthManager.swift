import HealthKit

import HealthKit

class HealthManager: ObservableObject {
    private let healthStore = HKHealthStore()
    @Published var currentHeartRate: Double?
    @Published var lastReadingDate: Date?
    
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        // Check if HealthKit is available
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false, NSError(domain: "com.yourapp", code: 2, userInfo: [NSLocalizedDescriptionKey: "HealthKit is not available on this device"]))
            return
        }
        
        // Data types to read
        let readTypes: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        
        // Request authorization
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            completion(success, error)
        }
    }
    
    func getLatestHeartRate(completion: @escaping (Double?, Date?, Error?) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            completion(nil, nil, NSError(domain: "com.yourapp", code: 5, userInfo: [NSLocalizedDescriptionKey: "Heart rate data not available"]))
            return
        }
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(
            sampleType: heartRateType,
            predicate: nil, // Get all available samples
            limit: 1, // We only want the most recent one
            sortDescriptors: [sortDescriptor]
        ) { _, samples, error in
            guard let samples = samples, let mostRecentSample = samples.first as? HKQuantitySample else {
                completion(nil, nil, error)
                return
            }
            let heartRateUnit = HKUnit(from: "count/min")
            let heartRate = mostRecentSample.quantity.doubleValue(for: heartRateUnit)
            let sampleDate = mostRecentSample.startDate
            
            completion(heartRate, sampleDate, nil)
        }
        healthStore.execute(query)
        

    }
}
