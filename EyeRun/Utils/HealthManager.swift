import HealthKit

class HealthManager: NSObject, ObservableObject {
    private let healthStore = HKHealthStore()
    @Published var currentHeartRate: Double?
    @Published var lastReadingDate: Date?
    @Published var isLoading = false
    @Published var error: Error?
    
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
            HKObjectType.quantityType(forIdentifier: .stepCount)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            DispatchQueue.main.async {
                if success {
                    self.fetchHeartRate()
                }
                self.error = error
                completion(success, error)
            }
        }
    }
    
    // Fungsi utama untuk mengambil dan mengupdate data
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
    
    private func getLatestHeartRate(completion: @escaping (Double?) -> Void) {
        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
            completion(nil)
            return
        }
        
        let now = Date()
        let startDate = Calendar.current.date(byAdding: .hour, value: -24, to: now)!
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: now, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(
            sampleType: heartRateType,
            predicate: predicate,
            limit: 1,
            sortDescriptors: [sortDescriptor]
        ) { _, samples, error in
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
}
