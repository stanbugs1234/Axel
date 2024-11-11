//
//  SettingsRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/14/23.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12){
        Image(systemName: imageName)
            .imageScale(.medium)
            .font(.title)
            .foregroundColor(tintColor)
        
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.themeGreen)
        }
        .padding(4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", tintColor: Color(.systemPurple))
    }
}
