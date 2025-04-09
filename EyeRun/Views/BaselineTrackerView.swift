import SwiftUI

struct BaselineTrackerView: View {
    @State private var selectedDate = Date()
    @EnvironmentObject var healthManager: HealthManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Date
                    DateView(selectedDate: $selectedDate)
                        .padding(.horizontal)
                
                    // Primary Metrics
                    VStack {
                        PrimaryMetrics(selectedDate: $selectedDate)
                        
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
    }
}


#Preview {
    BaselineTrackerView()
        .environmentObject(GoalsManager())
        .environmentObject(HealthManager())
}
