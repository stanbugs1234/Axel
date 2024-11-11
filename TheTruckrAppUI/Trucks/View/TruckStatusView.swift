//
//  TruckStatusView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/14/24.
//

import SwiftUI

struct TruckStatusView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Truck Status")
                    .fontWeight(.semibold)
            }
            
            //MARK: Row View of Drivers
            
            Spacer()
        }
        .foregroundColor(.themeGreen)
    }
}

#Preview {
    NavigationStack{
        TruckStatusView()
    }
}
