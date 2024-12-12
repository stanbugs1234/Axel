//
//  UpdatedHomeViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/18/24.
//

import Foundation

class UpdatedHomeViewModel: ObservableObject {
    @Published var deliveryOption: DeliveryOptionMenuEnum = .delivery
    @Published var deliveryType: UpdatedHomeRowCategoryViewModel = .triaxle
    
}
