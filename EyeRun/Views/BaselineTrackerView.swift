import SwiftUI

struct BaselineTrackerView: View {
    @EnvironmentObject var manager: HealthManager
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Date
                    DateView()
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
                    SecondaryMetrics()
                        .padding(.horizontal)
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
}
