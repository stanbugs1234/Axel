//
//  LocationManager.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/10/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var ticketPickUp: CLLocationCoordinate2D?
    @Published var ticketDropOff: CLLocationCoordinate2D?
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        self.userLocation = location.coordinate
//        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }
}
