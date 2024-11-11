//
//  TicketDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/6/23.
//

import SwiftUI

struct TicketDetailView: View {
    var photo: Photo
    
    var body: some View {
        let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
        
        VStack {
            NavigationView {
                VStack{
                    
                    Spacer()
                    
                    AsyncImage(url: imageURL,
                               content: { image in
                        image.resizable()
                        //Order is important here!
                            .frame(width: 400, height: 400)
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(20)
                    },
                               placeholder: {
                        ProgressView()
                    })
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        HStack {
                            Text("User:")
                                .bold()
                                .font(.headline)
                            Text(photo.user)
                                .foregroundColor(.secondary)
                                .font(.headline)
                        }
                        
                        HStack {
                            Text("Date:")
                                .bold()
                                .font(.headline)
                            Text(photo.postedOn.formatted())
                                .foregroundColor(.secondary)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Tickets")
        }
    }
}



struct TicketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TicketDetailView(photo: dev.mockPhoto)
        }
    }
}

