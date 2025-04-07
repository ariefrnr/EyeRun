//
//  StepsController.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 29/03/25.
//

import SwiftUI
import CoreMotion

class StepsController: ObservableObject {
    @Published var steps: Int = 0
    @Published var isRealTimeActive: Bool = false

    private let model: Steps = Steps(pedometer: CMPedometer())
    let deviceType: Device

    enum Device {
        case iPhone
        case simulator
    }

    enum SystemError: LocalizedError {
        case stepCountingNotAvailable(message: String = "❌ Step counting is not available on this device.")
        case invalidDevice(message: String = "❌ Invalid device.")
        case realTimeNotActive(message: String = "Real-time steps tracking is not active.")

        // 👇 Tambahkan deskripsi error agar bisa tampil saat catch error
        var errorDescription: String? {
            switch self {
            case .stepCountingNotAvailable(let message),
                 .invalidDevice(let message),
                 .realTimeNotActive(let message):
                return message
            }
        }
    }

    init(deviceType: Device) {
        self.deviceType = deviceType
    }

    func fetchDailySteps() throws {
        if deviceType == .simulator {
            print("⚠️ Simulator Mode: Simulating Step Count")

            // Tambah terus setiap kali dipanggil (simulasi berjalan)
            DispatchQueue.main.async {
                self.steps += Int.random(in: 10...30) // Bertambah setiap fetch
            }
        } else if deviceType == .iPhone {
            guard CMPedometer.isStepCountingAvailable() else {
                throw SystemError.stepCountingNotAvailable()
            }

            model.dailySteps { [weak self] steps in
                DispatchQueue.main.async {
                    self?.steps = steps
                }
            }
        } else {
            throw SystemError.invalidDevice()
        }
    }

    func startRealTimeStepCounting() throws {
        isRealTimeActive = true

        if deviceType == .simulator {
            print("⚠️ Simulator Mode: Simulating Real-Time Steps")
            if !isRealTimeActive {
                throw SystemError.realTimeNotActive()
            }

            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self, self.isRealTimeActive else {
                    timer.invalidate()
                    return
                }
                DispatchQueue.main.async {
                    self.steps += Int.random(in: 1...5)
                    print("📈 Simulated Real-Time Steps: \(self.steps)")
                }
            }
        } else if deviceType == .iPhone {
            guard CMPedometer.isStepCountingAvailable() else {
                throw SystemError.stepCountingNotAvailable()
            }

            model.realTimeSteps { [weak self] steps in
                DispatchQueue.main.async {
                    self?.steps = steps
                }
            }
        } else {
            throw SystemError.invalidDevice()
        }
    }

    func stopRealTimeStepCounting() throws {
        guard isRealTimeActive else {
            throw SystemError.realTimeNotActive()
        }

        if deviceType == .simulator {
            self.isRealTimeActive = false
            print("🔴 Stopped Simulated Real-Time Tracking")
        } else if deviceType == .iPhone {
            self.isRealTimeActive = false
            model.stopRealTimeSteps()
        } else {
            throw SystemError.invalidDevice()
        }
    }
}
