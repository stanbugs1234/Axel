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
    static var cardHalfWidth: CGFloat {
       (UIScreen.main.bounds.width - 30) / 2
   }
    static var cardFeaturedWidth: CGFloat {
        (UIScreen.main.bounds.width - 30) / 1.25
   }
     static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    static var cardThirdHeight: CGFloat {
        UIScreen.main.bounds.height / 5
    }
    static var cardQuarterHeight: CGFloat {
        UIScreen.main.bounds.height / 4
   }
    static var cardButtonHeight: CGFloat {
        UIScreen.main.bounds.height / 9
   }
    static var cardTileHeight: CGFloat {
        UIScreen.main.bounds.height / 8.5
   }
    static var cardNotificationHeight: CGFloat {
        UIScreen.main.bounds.height / 12
   }
}
