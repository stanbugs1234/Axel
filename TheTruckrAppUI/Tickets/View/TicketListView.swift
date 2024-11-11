//
//  TicketListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/1/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import Firebase

struct TicketListView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var retrieveImages = [UIImage]()
    let user: User
    @State var photo: Photo
    
    //The variable below doesn't have the right path.  We'll change this in .onAppear
    @FirestoreQuery(collectionPath: "users") var photos: [Photo]
    
    var body: some View {
        
        NavigationView {
            VStack() {
                List(photos, id: \.id) { photo in
                    NavigationLink {
                        TicketDetailView(photo: photo)
                    } label: {
                        HStack {
                            TicketRowView(photo: photo)
                        }
                    }
                }
                
                NavigationLink {
                    CameraView()
                } label: {
                    CreateNewButton(buttonText: "Upload Ticket")
                }
            }
        }
        .navigationTitle("Tickets")
        .onAppear{
            $photos.path = "users/\(user.id)/photos"
            print("DEBUG: photos.path = \($photos.path)")
        }
    }
}
struct TicketListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TicketListView(user: dev2.mockUser, photo: Photo())
                .environmentObject(AuthViewModel())
        }
        
    }
}
