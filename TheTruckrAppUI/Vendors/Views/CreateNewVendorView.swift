//
//  CreateNewVendorView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/8/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CreateNewVendorView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadVendorViewModel()
    
    @State private var vendorFullName = ""
    @State private var vendorAddress = ""
    @State private var vendorIdentification = ""
    
    var body: some View {
            VStack {
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                    
                    Spacer()
                    
                    Text("New Vendor")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    //                    .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    Spacer()
                    
                    Button {  viewModel.uploadVendor(vendorFullName: vendorFullName,
                                                     vendorCompanyId:vendorIdentification,
                                                     vendorAddressName:vendorAddress)} label: {
                        Text("Save")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.black)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding()
                
                Text("Enter Vender Information Below")
                    .font(.headline)
                
                Form {
                    TextField("Enter Vendor Full Name",
                              text: $vendorFullName)
                    
                    TextField("Enter Vendor Address",
                              text: $vendorAddress)
                    
                    TextField("Enter Vendor Identification",
                              text: $vendorIdentification)
                }

                
                Spacer()
                
//                Button {
//                    Task {
//                        viewModel.uploadVendor(vendorFullName: vendorFullName,
//                                               vendorCompanyId:vendorIdentification,
//                                               vendorAddressName:vendorAddress)
//                    }
//                } label: {
//                    ButtonView(size: .medium, buttonString: "Save")
//                }
                
            }
            .onReceive(viewModel.$didUploadVendor) { success in
                if success {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    DismissKeyboardButton()
                }
            }
    }
}

struct CreateNewVendorView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewVendorView()
    }
}

//extension CreateNewVendorView {
//    func createNewVendor() {
//
//        let vendor = Vendor(
//            vendorId: UUID().uuidString,
//            vendorFullName: vendorFullName,
//            vendorAddressName: vendorAddress
//        )
//
//        guard let encodedVendor = try? Firestore.Encoder().encode(vendor) else { return }
//
//        Firestore.firestore().collection("vendors").document().setData(encodedVendor) { _ in
//            print("DEBUG: Uploaded Vendor to Firestore")
//        }
//    }
//}
