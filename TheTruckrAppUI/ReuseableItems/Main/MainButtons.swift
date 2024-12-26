//
//  MainButtons.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/29/23.
//

import SwiftUI

struct MainButtons: View {
    var viewModel: MainHomeTabViewModel
    let size: ButtonSize
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .scaledToFill()

                Text(viewModel.title)
                    .font(size.fontSize)
                    .fontWeight(.semibold)
            }
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.themeGreen)
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

struct MainButtons_Previews: PreviewProvider {
    static var previews: some View {
        MainButtons(viewModel: .scheduleTrucks, size: .small)
    }
}
