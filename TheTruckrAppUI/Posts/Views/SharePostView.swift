//
//  SharePostView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/29/23.
//

import SwiftUI

struct SharePostView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    let post: Post
    
    var body: some View {
        VStack {
            NewCommentRowView(post: post)
                .frame(height: 80)
            
            Divider()
            
            ScrollView {
                MessageRowView(post: post, user: post.user!)
                    .padding(.top, 5)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Share Post")
    }
        
}

struct SharePostView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            SharePostView(post: dev2.mockPost)
                .environmentObject(AuthViewModel())
        }
    }
}
