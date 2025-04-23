import SwiftUI
import HealthKit
import HealthKitUI

let readTypes: Set<HKObjectType> = [
    HKObjectType.quantityType(forIdentifier: .heartRate)!,
    HKObjectType.quantityType(forIdentifier: .stepCount)!,
    HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
    HKObjectType.quantityType(forIdentifier: .stepCount)!,
    HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
    HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
]

struct BaselineTrackerView: View {
    @State private var trigger: Bool = false
    @State private var selectedDate = Date()
    var healthManager = HealthManager()
    var goalsManager = GoalsManager()
    
    private let store = HKHealthStore()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Date
                    DateView(selectedDate: $selectedDate)
                        .padding(.horizontal)
                
                    // Primary Metrics
                    VStack {
                        PrimaryMetrics(selectedDate: $selectedDate, goalsManager: goalsManager, healthManager: healthManager)
                        
                        NavigationLink(destination: LiveRunningView()) {
                            HStack{
                                Text("Start Running")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Image(systemName: "play.fill")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.customizedOrange)
                            .cornerRadius(25)
                        }
                    }
                    .padding(.horizontal)

                    // Secondary Metrics
                    SecondaryMetrics(
                        selectedDate: $selectedDate,
                        goalsManager: goalsManager,
                        healthManager: healthManager
                    )
                        .padding(.horizontal)
                   
                }
                .onChange(of: selectedDate, { oldValue, newValue in
                    healthManager.fetchAllMetrics(for: newValue)
                })
                .onAppear {
                    healthManager.fetchAllMetrics(for: selectedDate)
                }
                .padding(.vertical)
            }
            .navigationTitle("Activities Overview")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if HKHealthStore.isHealthDataAvailable() {
                DispatchQueue.main.async {
                    trigger.toggle()
                }
            }
        }
        .healthDataAccessRequest(store: store, readTypes: readTypes, trigger: trigger) { result in
            switch result {
            case .success(_):
                print("Authorization Success")
            case .failure(let error):
                print("Authorization Error: \(error.localizedDescription)")
            }
        }
    }
}


#Preview {
    BaselineTrackerView()
        .environmentObject(GoalsManager())
        .environmentObject(HealthManager())
}
