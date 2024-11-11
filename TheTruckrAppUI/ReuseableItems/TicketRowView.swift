//
//  TicketRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/1/23.
//

import SwiftUI

struct TicketRowView: View {
    let photo: Photo
    
    
    var body: some View {
        let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
        
        VStack(alignment: .leading) {
            //Ticket Image
            HStack {
                AsyncImage(url: imageURL,
                           content: { image in
                    image
                        .resizable()
                    //Order is important here!
                        .frame(width: 75, height: 75)
                        .scaledToFit()
                        .clipped()
                        .cornerRadius(20)
                },
                           placeholder: {
                    ProgressView()
                })
                .padding()

                VStack(alignment: .trailing, spacing: 10) {
                    Text(photo.user)
                        .fontWeight(.semibold)
                        .font(.headline)
                    
                    Text(photo.postedOn.formatted())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
//            HStack {
//                Rectangle()
//                    .frame(width: 400, height: 0.75)
//                    .opacity(0.7)
//                    .foregroundColor(Color(.separator))
//                    .shadow(color: .black.opacity(0.7), radius:4 )
//            }
//            .frame(maxWidth: .infinity)
//            .padding(.leading)
        }
    }
}


struct TicketRowView_Previews: PreviewProvider {
    static var previews: some View {
        TicketRowView(photo: dev.mockPhoto)
    }
}

