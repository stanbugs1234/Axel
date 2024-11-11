//
//  PhotoImagePickerView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/22/23.
//

import SwiftUI
import PhotosUI

struct PhotoImagePickerView: View {
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    struct FakePhoto: Identifiable{
        let id = UUID().uuidString
        var imageURLString = "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/dn36JHwwu5YerAdctVuW9Insu372CF1FCA3E-BED5-4715-B7DC-FA054A01F823.jpeg?alt=media&token=82ea832f-53fa-4fa2-b128-8eef14c00a25"
    }
        let photos = [FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto(),FakePhoto()]
        
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]

        var body: some View {

            NavigationView {
                ScrollView(showsIndicators: true) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(photos) {photo in
                                let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
                                
                                AsyncImage(url: imageURL) { image in
                                    image
                                        .resizable()
                                    //Order is important here!
                                        .frame(width: 170, height: 170)
                                        .scaledToFill()
                                        .clipped()
                                        .cornerRadius(20)
                                    
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                }
                .navigationTitle("Tickets")
                Spacer()
            }

        }
    }

    
    struct PhotoImagePickerView_Previews: PreviewProvider {
        static var previews: some View {
            PhotoImagePickerView()
        }
    }

