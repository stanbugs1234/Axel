//
//  PhotoView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/18/23.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct PhotoView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var photo = Photo()
    var uiImage: UIImage
    @Environment(\.dismiss) private var dismiss
    @State var retrieveImages = [UIImage]()

    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                TextField("Description", text: $photo.description)
                    .textFieldStyle(.roundedBorder)
                
                Text("By: \(photo.user) on: \(photo.postedOn.formatted(date: .numeric, time: .shortened))")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button("Save") {
                        Task {
                            let success = await homeViewModel.saveImage(user: UserService.shared.currentUser!, photo: photo, image: uiImage)
                            if success {
                                dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
}
    
    struct PhotoView_Previews: PreviewProvider {
        static var previews: some View {
            PhotoView(uiImage: UIImage(imageLiteralResourceName: "male"))
        }
    }

extension PhotoView {
    func retrievePhotos() {
        
        //Get the data from the database
        let db = Firestore.firestore()
        
        db.collection("photos").getDocuments { snapshot, error in
            if error == nil && snapshot != nil {
                
                var paths = [String]()
                
                //Loop through all the returned docs
                for doc in snapshot!.documents {
                    
                    // extract the file path and add to array
                    paths.append(doc["url"] as! String)
                    
                }
                
                //                Loop through each file path and fetch the data from storage
                for path in paths {
                    
                    //Get a reference to storage
                    let storageRef = Storage.storage().reference()
                    
                    //Specify the path
                    let fileRef = storageRef.child(path)
                    
                    //Retrieve the data
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        
                        //Check for errors
                        if error == nil && data != nil {
                            
                            //Create a UiImage and put into our array for display
                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    retrieveImages.append(image)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        //Get the image data in storage for each image reference
        
        //Display the images
    }
}
