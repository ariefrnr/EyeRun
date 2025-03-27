import SwiftUI

struct StopwatchRun: View {
    @State private var elapsedTime: Double = 0
    @State private var isRunning = true
    @State private var isPaused = false
    @State private var isStopped = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // Formatted time string
    var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let tenths = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 10)
        
        return String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(formattedTime)
                .font(.system(size: 64, weight: .bold, design: .monospaced))
                .foregroundColor(isStopped ? .customizedOrange : .black)
                .frame(width: 350)
            
            if isStopped {
                Text("Stopped")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.heartRateRed)
                  
            } else if isPaused {
                Text("Paused")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.customizedOrange)
                
            } else if isRunning {
                Text("Live Running")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.customGreen)
            }
            
            HStack {
                Button(action: {
                    isRunning = false
                    isPaused = false
                    isStopped = true
                }) {
                    Image(systemName: "stop.fill")
                        .padding()
                        .frame(width: 60, height: 60)
                        .font(.system(size: 28))
                        .background(Color.heartRateRed)
                        .foregroundColor(Color.white)
                        .cornerRadius(500)
                }
                Spacer()
                if isStopped {
                    Button(action: {}) {
                        Image(systemName: "play.fill")
                            .padding()
                            .frame(width: 60, height: 60)
                            .font(.system(size: 28))
                            .background(Color.gray.opacity(0.4))
                            .foregroundColor(Color.gray)
                            .cornerRadius(500)
                    }
                    .disabled(true)
                } else if isRunning {
                    Button(action: {
                        isRunning = false
                        isPaused = true
                    }) {
                        Image(systemName: "pause.fill")
                            .padding()
                            .frame(width: 60, height: 60)
                            .font(.system(size: 28))
                            .background(Color.customizedOrange)
                            .foregroundColor(Color.white)
                            .cornerRadius(500)
                    }
                } else if isPaused {
                    Button(action: {
                        isRunning = true
                        isPaused = false
                    }) {
                        Image(systemName: "play.fill")
                            .padding()
                            .frame(width: 60, height: 60)
                            .font(.system(size: 28))
                            .background(Color.customGreen)
                            .foregroundColor(Color.white)
                            .cornerRadius(500)
                    }
                }
            }
            .frame(width: 350)
        }
        .padding()
        .onReceive(timer) { _ in
            if isRunning {
                elapsedTime += 0.1
            }
        }
    }
}

// Preview
#Preview {
    StopwatchRun()
}
