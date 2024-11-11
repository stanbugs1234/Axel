//
//  Keyboard.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 10/21/23.
//

import Foundation
import UIKit

struct Keyboard {
    
    static func dismissKeyboard() {
      UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true) // 4
    }
}
