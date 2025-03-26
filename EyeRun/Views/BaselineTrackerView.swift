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
                    PrimaryMetrics()
                        .padding(.horizontal)

                    // Secondary Metrics
                    SecondaryMetrics()
                        .padding(.horizontal)

                    // Average Stat
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.indigo)
                        .frame(height: 100)
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
