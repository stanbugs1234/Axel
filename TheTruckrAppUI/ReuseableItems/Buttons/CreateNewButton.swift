//
//  CreateNewButton.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import SwiftUI

struct CreateNewButton: View {
    var buttonText = ""
    
    var body: some View {
        VStack {
            HStack   {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .foregroundColor(.themeGreen)
            }
            
            Text(buttonText)
                .foregroundColor(.themeGreen)
        }
    }
}

struct CreateNewButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewButton(buttonText: "Add a Truck")
    }
}
