import SwiftUI

struct BaselineTrackerView: View {
    @State private var selectedDate = Date()
    @EnvironmentObject var healthManager: HealthManager
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Date
                    DatePicker(selectedDate: $selectedDate)
                        .padding(.horizontal)

                    // Primary Metrics
                    VStack {
                        PrimaryMetrics()
                        
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
                    SecondaryMetrics(selectedDate: $selectedDate)
                        .padding(.horizontal)
                }
                .onChange(of: selectedDate) {
                    newDate in
                    print("date changed to: \(newDate)")
                    healthManager.fetchStepCount(for: newDate)
                    healthManager.fetchCaloriesData(for: newDate)
                }
                .padding(.vertical)
            }
            .navigationTitle("Activities Overview")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    BaselineTrackerView()
}
