//
//  GeoPoint.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/17/23.
//

import Firebase
import CoreLocation

extension GeoPoint {
    func toCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
