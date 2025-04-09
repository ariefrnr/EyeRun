//
//  LocationManager.swift
//  EyeRun
//
//  Created by Arief Roihan Nur Rahman on 08/04/25.
//

import Foundation
import CoreLocation
import Combine

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var distance: Double = 0.0
    @Published var pace: Double = 0.0

    private var previousLocation: CLLocation?
    private var isTracking = false
    private var startTime: Date?

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
        previousLocation = nil
        isTracking = true
        locationManager.startUpdatingLocation()
    }

    func pauseTracking() {
        isTracking = false
        locationManager.stopUpdatingLocation()
    }

    func stopTracking() {
        isTracking = false
        locationManager.stopUpdatingLocation()
        distance = 0
        pace = 0
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard isTracking, let location = locations.last else { return }

        if let lastLocation = previousLocation {
            let delta = location.distance(from: lastLocation)
            distance += delta
            
            if let start = startTime {
                let timeElapsed = Date().timeIntervalSince(start)
                pace = distance > 0 ? timeElapsed / distance : 0
            }
        }

        previousLocation = location
    }
}
