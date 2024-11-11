//
//  CameraView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/18/23.
//

import SwiftUI
import AVFoundation
import Firebase
import FirebaseStorage

struct CameraView: View {
    
    var body: some View {
        AccessCamera()
        }
    }

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct AccessCamera: View {
    @StateObject var camera = CameraModel()
    @EnvironmentObject var homeViewModel: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    let currentUser = UserService.shared.currentUser?.uid

    //let photo: Photo
    //let ticket: Ticket
    
    
    var body: some View{
        ZStack {
            // Going to be Camera Preview...
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
                if camera.isTaken {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: camera.reTake, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    // if taken showing save and again take button...
                    
                    if camera.isTaken {
                        
                        Button(action: {if !camera.isSaved{ camera.savePicFireStore()}}, label: {

                            Text(camera.isSaved ? "Saved & Sent" : "Save & Email")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                                
                        })
                        .padding(.leading)
                        
                        
                        Spacer()
                        
                    }
                    
                    else {
                        Button(action: camera.takePic, label: {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65,
                                           height: 65)
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            }
                        })
                    }
                }
                .frame(height: 75)
            }
        }
        .onAppear(perform: {
            camera.Check()
        })
    }
}

//MARK: Camera Model

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    @Published var isTaken = false
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    // since were going to read pic data....
    @Published var output = AVCapturePhotoOutput()
    
    //Preview...
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    //Pic Data
    @Published var isSaved = false

    @Published var picData = Data(count: 0)
    

    
    func Check() {
        
        //first checking camera has got permission..
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
            // Setting Up Session
        case .notDetermined:
            //retesting for permisson....
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUp() {
        
        // setting up camera...
        
        do{
            
            //setting configs
            self.session.beginConfiguration()
            
            //change for you own...
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            //Checking and adding to session..
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            //same for output....
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
    //take and retake functions
    
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)

            //DispatchQueue.main.async {
                //withAnimation{self.isTaken.toggle()}
                
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { self.session.stopRunning()
                    withAnimation{self.isTaken.toggle()}
                
                //self.session.stopRunning()
            }
        }
    }
    
    func reTake() {
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation{self.isTaken.toggle()}
                
                //Clearing
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if error != nil {
            return
        }
        
        print("DEBUG: pic taken....")
        
        guard let imageData = photo.fileDataRepresentation() else {return}
        
        self.picData = imageData
    }
    
    func savePic(){
        let image = UIImage(data: self.picData)!
        
        //saving Image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        self.isSaved = true
        
        print("DEBUG: Saved Successfully")
    }
    
    
    
    func savePicFireStore() {
        let image = UIImage(data: self.picData)!
        let photo = Photo()

        Task{
            await saveImage( photo: photo, image: image)
        }
        
        self.isSaved = true
        
        //Need to add dismiss button
        if self.isSaved == true {
            
        }
        
        
        print("DEBUG: Saved Successfully to Firestore")
        
            
    }
    
    func saveImage( photo: Photo, image: UIImage) async -> Bool {
        let image = UIImage(data: self.picData)!
        
        guard let user = Auth.auth().currentUser?.uid else {
            print("DEBUG: Error --- User Id is Nil")
            return false
        }
        let photoName = UUID().uuidString // This will be the name of the image file
        let storage = Storage.storage() // Create a Firebase Storage Instance
        let storageRef = storage.reference().child("\(user)\(photoName).jpeg")
        
        guard let resizedImage = image.jpegData(compressionQuality: 0.2) else {
            print("DEBUG: Could not resize image")
            return false
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg" //Setting metada allows you to see console image in the web browser.  This setting will for png as well as jpeg
        
        var imageURLstring = ""
        
        do {
            let _ = try await storageRef.putDataAsync(resizedImage, metadata: metadata)
            print("DEBUG: Image Saved!")
            do {
                let imageURL = try await storageRef.downloadURL()
                imageURLstring = "\(imageURL)"
            } catch {
                print("DEBUG: Could not get imageURL after saving image \(error.localizedDescription)")
                      return false
            }
        } catch {
            print("DEBUG: Uploading image to Firebase Storage")
            return false
        }
        //NOw save to the photos collection of the users document
        let db = Firestore.firestore()
        let collectionString = "users/\(user)/photos"
        
        do {
            var newPhoto = photo
            newPhoto.imageURLString = imageURLstring
            try await db.collection(collectionString).document(photoName).setData(newPhoto.dictionary)
            print("DEBUG: Data updated successfully")
            return true
        } catch {
            print("DEBUG: Could not update data in photos for userID \(user)")
            return false
        }
    }
    

}
    //setting view for preview
struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        //Your Own Properties ..
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        //starting session
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context){
        
    }
}
