//
//  DriverStatusView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/28/24.
//

import SwiftUI

struct DriverStatusView: View {
    @State private var driverState = false
    
    var body: some View {
        Button {
            driverState.toggle()
        } label: {
            
            //MARK: Status Off
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                if driverState == false {
                    HStack {
                        Image(systemName: "car.top.radiowaves.rear.right.badge.xmark.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.red)
                            .padding(.horizontal, 10)
                        
                        Text("Status is Off")
                            .foregroundStyle(.theme)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("Click to Turn On")
                            .foregroundStyle(.theme)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                        
                        
                    }
                } else {
                    //MARK: Status On
                    HStack{
                        Image(systemName: "steeringwheel")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                            .padding(.horizontal, 10)
                        
                        Text("Available to Work")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(6)
                        
                        Spacer()
                        
                        Text("Click to Turn Off")
                            .foregroundStyle(.theme)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 10)
                    }
                    .foregroundStyle(.theme)
                    .fontWeight(.semibold)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .foregroundStyle(.bar)
        .frame(width: SizeConstants.cardWidth,
               height: SizeConstants.cardButtonHeight)
    }
}

#Preview {
    DriverStatusView()
}
