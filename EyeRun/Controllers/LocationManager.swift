//
//  LocationManager.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 08/04/25.
//

import Foundation
import CoreLocation
import CoreMotion
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    private let pedometer = CMPedometer()

    @Published var distance: Double = 0.0            // meter
    @Published var pace: Double = 0.0                // menit/km
    @Published var cadence: Int = 0                  // langkah/menit (dari pedometer)
    @Published var calories: Double = 0.0            // kcal
    @Published var speed: Double = 0.0               // km/h

    private var previousLocation: CLLocation?
    private var isTracking = false
    private var startTime: Date?

    private let caloriesPerMeter: Double = 0.08

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.activityType = .fitness
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func startTracking() {
        startTime = Date()
        distance = 0
        pace = 0
        cadence = 0
        calories = 0
        speed = 0
        previousLocation = nil
        isTracking = true

        locationManager.startUpdatingLocation()

        // Start pedometer
        if CMPedometer.isCadenceAvailable() && CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { [weak self] data, error in
                guard let self = self, let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    self.cadence = data.currentCadence?.intValue ?? 0 // langkah/menit
                }
            }
        }
    }

    func pauseTracking() {
        isTracking = false
        locationManager.stopUpdatingLocation()
        pedometer.stopUpdates()
    }

    func stopTracking() {
        isTracking = false
        locationManager.stopUpdatingLocation()
        pedometer.stopUpdates()
        distance = 0
        pace = 0
        cadence = 0
        calories = 0
        speed = 0
        previousLocation = nil
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard isTracking, let location = locations.last else { return }

        if let lastLocation = previousLocation {
            let delta = location.distance(from: lastLocation) // meter
            distance += delta

            // Hitung kalori berdasarkan jarak
            calories += delta * caloriesPerMeter

            let timeInterval = location.timestamp.timeIntervalSince(lastLocation.timestamp)
            if timeInterval > 0 {
                // Speed (m/s) -> km/h
                let speedMetersPerSecond = delta / timeInterval
                speed = speedMetersPerSecond * 3.6
            }

            if let start = startTime {
                let totalTime = Date().timeIntervalSince(start) // detik
                pace = distance > 0 ? (totalTime / (distance / 1000)) : 0
            }
        }

        previousLocation = location
    }
}
