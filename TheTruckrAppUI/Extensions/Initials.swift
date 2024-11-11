//
//  NameFormatter.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/24/23.
//

import Foundation


public func initials(from fullName: String) -> String? {
    let formatter = PersonNameComponentsFormatter()
    if let components = formatter.personNameComponents(from: fullName) {
        formatter.style = .abbreviated
        return formatter.string(from: components)
    }
    return nil
}


