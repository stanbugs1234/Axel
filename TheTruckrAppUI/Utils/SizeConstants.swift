//
//  SizeConstants.swift
//  AccordUI
//
//  Created by Stan Bugusky on 3/16/24.
//

import SwiftUI

struct SizeConstants {
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    
     static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
     static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    static var cardThirdHeight: CGFloat {
        UIScreen.main.bounds.height / 4.5
   }
    static var cardButtonHeight: CGFloat {
        UIScreen.main.bounds.height / 10
   }
}
