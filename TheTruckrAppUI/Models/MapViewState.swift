//
//  MapViewState.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/11/23.
//

import Foundation

enum MapViewState {
    case noIput
    case locationSelected
    case searchingForLocation
    case polylineAdded
    case tripRequested
    case tripAccepted
    case tripRejected
}
