import SwiftUI
import CoreLocation

struct StopwatchRun: View {
    @ObservedObject var manager: LocationManager
    @Binding var elapsedTime: Double
    @Binding var state: StopwatchState

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var formattedTime: String {
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let tenths = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 10)
        return String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
    }

    var body: some View {
        VStack(spacing: 20) {
            Text(formattedTime)
                .font(.system(size: 64, weight: .bold, design: .monospaced))
                .foregroundColor(state == .stopped ? .customizedOrange : .black)
                .frame(width: 350)

            Text(statusText)
                .font(.system(size: 20))
                .foregroundColor(statusColor)

            HStack {
                Button {
                    state = .stopped
                    manager.stopTracking()
                } label: {
                    Image(systemName: "stop.fill")
                        .buttonStyle(color: .customizedOrange)
                }

                Spacer()
                
                switch state {
                    case .idle, .paused:
                        Button {
                            state = .running
                            manager.startTracking()
                        } label: {
                            Image(systemName: "play.fill")
                                .buttonStyle(color: .green)
                        }
    
                    case .running:
                        Button {
                            state = .paused
                            manager.pauseTracking()
                        } label: {
                            Image(systemName: "pause.fill")
                                .buttonStyle(color: .customizedOrange)
                        }
    
                    case .stopped:
                        Image(systemName: "play.fill")
                            .buttonStyle(color: .gray)
                            .disabled(true)
                }
            }
            .frame(width: 350)
        }
        .padding()
        .onReceive(timer) { _ in
            if state == .running {
                elapsedTime += 0.1
            }
        }
    }

    private var statusText: String {
        switch state {
            case .idle: return "Idle"
            case .running: return "Live Running"
            case .paused: return "Paused"
            case .stopped: return "Stopped"
        }
    }

    private var statusColor: Color {
        switch state {
            case .idle: return .gray
            case .running: return .green
            case .paused: return .orange
            case .stopped: return .red
        }
    }
}

extension Image {
    func buttonStyle(color: Color) -> some View {
        self
            .padding()
            .frame(width: 60, height: 60)
            .font(.system(size: 28))
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(500)
    }
}

#Preview {
    StopwatchRun(
        manager: LocationManager(),
        elapsedTime: .constant(0),
        state: .constant(.idle)
    )
}


//import SwiftUI
//import CoreLocation
//
//struct StopwatchRun: View {
//    @ObservedObject var manager: LocationManager
//    @Binding var elapsedTime: Double
//    @Binding var state: StopwatchState
//
//    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//
//    var formattedTime: String {
//        let minutes = Int(elapsedTime) / 60
//        let seconds = Int(elapsedTime) % 60
//        let tenths = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 10)
//        return String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text(formattedTime)
//                .font(.system(size: 64, weight: .bold, design: .monospaced))
//                .foregroundColor(state == .stopped ? .customizedOrange : .black)
//
//            Text(statusText)
//                .font(.title2)
//                .foregroundColor(statusColor)
//
//            HStack {
//                Button {
//                    state = .stopped
//                    manager.stopTracking()
//                } label: {
//                    Image(systemName: "stop.fill")
//                        .buttonStyle(color: .red)
//                }
//
//                Spacer()
//
//                switch state {
//                case .idle, .paused:
//                    Button {
//                        state = .running
//                        manager.startTracking()
//                    } label: {
//                        Image(systemName: "play.fill")
//                            .buttonStyle(color: .green)
//                    }
//
//                case .running:
//                    Button {
//                        state = .paused
//                        manager.pauseTracking()
//                    } label: {
//                        Image(systemName: "pause.fill")
//                            .buttonStyle(color: .orange)
//                    }
//
//                case .stopped:
//                    Image(systemName: "play.fill")
//                        .buttonStyle(color: .gray)
//                        .disabled(true)
//                }
//            }
//        }
//        .onReceive(timer) { _ in
//            if state == .running {
//                elapsedTime += 0.1
//            }
//        }
//    }
//
//    private var statusText: String {
//        switch state {
//        case .idle: return "Idle"
//        case .running: return "Running"
//        case .paused: return "Paused"
//        case .stopped: return "Stopped"
//        }
//    }
//
//    private var statusColor: Color {
//        switch state {
//        case .idle: return .gray
//        case .running: return .green
//        case .paused: return .orange
//        case .stopped: return .red
//        }
//    }
//}
//
//extension Image {
//    func buttonStyle(color: Color) -> some View {
//        self
//            .padding()
//            .frame(width: 60, height: 60)
//            .font(.system(size: 28))
//            .background(color)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//    }
//}
//
//
//#Preview {
//    StopwatchRun(
//        manager: LocationManager(),
//        elapsedTime: .constant(0),
//        state: .constant(.idle)
//    )
//}
