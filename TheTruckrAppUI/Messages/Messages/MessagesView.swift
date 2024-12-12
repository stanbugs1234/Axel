//
//  MessagesView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/27/23.
//

import SwiftUI



struct MessagesView: View {
    var body: some View {
        VStack{
            FeedView()
                .padding(.bottom)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
