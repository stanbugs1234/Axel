//
//  VerificationUserInfo.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/28/24.
//

import SwiftUI

struct VerificationUserInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Image
            HStack {
                Spacer()
                
                Image(uiImage: .verificationInfo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardHalfWidth, height: 250)
                    .ignoresSafeArea(.all)
                Spacer()
            }
            
            //MARK: Verify identity title
            HStack {
                Text("Verify you identity")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Text("We want everyone to feel safe while they use \(AppConstants.appName).")
                .padding(.top, 2)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    VerificationUserInfo()
}
