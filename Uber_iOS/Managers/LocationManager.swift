//
//  LocationManager.swift
//  Uber_iOS
//
//  Created by Koulik Maity on 08/07/23.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject{
    
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // that give most accurate possible location for user location
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        self.userLocation = location.coordinate
        locationManager.stopUpdatingLocation()
    }
}
