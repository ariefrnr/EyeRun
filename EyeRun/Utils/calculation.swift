//
//  calculation.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 08/04/25.
//

func calculatePace(distance: Double, time: Double) -> String {
    guard distance > 0 else { return "--:--" }
    let minutesPerKm = time / 60 / distance
    let minutes = Int(minutesPerKm)
    let seconds = Int((minutesPerKm - Double(minutes)) * 60)
    return String(format: "%02d:%02d", minutes, seconds)
}
