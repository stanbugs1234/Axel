//
//  MainHomeNewsRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/4/23.
//

import SwiftUI

struct MainHomeNewsRowView: View {
    let size: ButtonSize
    let viewModel: MainHomeNewsRowViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: SizeConstants.cardHalfWidth - 20, height: SizeConstants.cardTileHeight, alignment: .center)
                    .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
                    .foregroundColor(.backgroundColor)
                
                    VStack {
                        HStack{
                            //MARK: Secondary Image
                            Image(systemName: viewModel.secondaryImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.imageSize/3, height: size.imageSize/3)
                                .rotationEffect(.degrees(180))
                                .offset(x: -8, y: 0)
                                .padding(.leading)
                            
                            //MARK: Primary Image
                            Image(systemName: viewModel.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: size.imageSize, height: size.imageSize, alignment: .leading)
                                .offset(x: -10, y: 0)
                        }

                        //MARK: Image Text
                        HStack {
                            Text(viewModel.title)
                                .font(size.fontSize)
                                .fontWeight(.semibold)
                        }
                    }
//                    .padding(.horizontal)
                    .padding(.trailing)
            }
        }
        .foregroundColor(.themeGreen)
    }
}

struct MainHomeNewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeNewsRowView(size: .xSmall, viewModel: .trucks)
    }
}

