//
//  CurrentUserProfileHeaderView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/21/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct CurrentUserProfileHeaderView: View {
    @ObservedObject var viewModel: AccountViewModel
    let user: User
    var body: some View {
        VStack {
            ZStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    CircularProfileImageView(user: user, size: .xxxLarge)
                        .background {
                            Circle()
                                .fill(Color(.systemGray6))
                                .frame(width: 158, height: 158)
                                .shadow(radius: 10)
                                .padding(.bottom, 2)
                        }
                    Image(systemName: "pencil")
                        .imageScale(.small)
                        .foregroundStyle(.theme)
                        .background {
                            Circle()
                                .fill(.gray)
                                .frame(width: 32, height: 32)
                        }
                        .offset(x: -35, y: -55)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileHeaderView(viewModel: AccountViewModel(), user: MockData.users.first!)
}
