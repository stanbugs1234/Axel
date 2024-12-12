//
//  InfoSectionMainView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/12/24.
//

import SwiftUI

struct InfoSectionMainView: View {
    var body: some View {
        ZStack {
            Image(.male)
                .resizable()
          
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardThirdHeight)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    InfoSectionMainView()
}
