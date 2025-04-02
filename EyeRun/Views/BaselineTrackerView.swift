import SwiftUI

struct BaselineTrackerView: View {
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
                            HorizontalButton(buttonName: "Start Running", systemImageName: "play.fill")
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
}
