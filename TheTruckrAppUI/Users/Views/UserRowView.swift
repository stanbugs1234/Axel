//
//  UserRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/25/23.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    private let user: User
    
    init(user: User){
        self.user = user
    }
    
    var body: some View {
        let abbreviatedName = initials(from: user.fullname)
        
        VStack(alignment: .leading) {
            HStack {
                CircularProfileImageView(user: user, size: .medium)
                
                VStack(alignment: .leading, spacing: 8){
                    Text(user.fullname)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.themeGreen)
                    
                    Text(user.email)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                    // .accentColor(Color.theme.primaryTextColor)
//                        .accentColor(.secondary)
//                        .opacity(0.77)
                }
                .padding(.leading, 4)
                            Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .padding()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UserRowView(user: dev2.mockUser)
        }
    }
}
