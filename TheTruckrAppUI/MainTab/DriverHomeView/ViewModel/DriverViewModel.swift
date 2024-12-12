//
//  DriverViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/28/24.
//

import Foundation

class DriverViewModel: ObservableObject {
    @Published var drivers: [Driver] = []
    @Published var driverState: Bool
    
    
    init() {
        driverState = false
    }
}
