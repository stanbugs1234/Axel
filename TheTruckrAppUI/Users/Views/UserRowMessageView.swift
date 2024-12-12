//
//  UserRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/28/23.
//

import SwiftUI
import Kingfisher

struct UserRowMessageView: View {
    let user: User

    var body: some View {
        let abbreviatedName = initials(from:user.fullname)
        HStack(spacing: 12) {
            CircularProfileImageView(user: user, size: .medium)
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname)
                    .font(.subheadline).bold()
                    .foregroundColor(.themeGreen)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        UserRowMessageView(user: MockData.users[0])
    }
}
