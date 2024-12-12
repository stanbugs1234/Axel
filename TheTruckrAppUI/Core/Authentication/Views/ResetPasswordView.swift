//
//  ResetPasswordView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/22/24.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
//    @Binding var path: [String]
    @State private var successful = false
    @State private var showSuccessfulAlert = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(){
                    //MARK: Login & Image
                    VStack(spacing: 8) {
                        //                        Image - Need to come up with an image
                        //Title
                        Text("\(AppConstants.appNameUpperCase)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        
                    }
                    .padding(.top, 5)
                    
                    VStack {
                        Text("Enter Email Below to Reset Pasword")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 20)
                    }
                    .padding()
                    .foregroundColor(.white)
                    
                    //Input Fields
                    VStack(spacing: 32) {
                        //input field 1
                        CustomInputField(text: $viewModel.email,
                                         title: "Email Address",
                                         placeholder: "name@example.com")
                        
                        Spacer()
                         
                        //MARK: Reset Email Button
                        Button {
                            Task { 
                                try await viewModel.resetPassword()
                                    showSuccessfulAlert = true
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                        } label: {
                            HStack {
                                Text("Reset Password")
                                    .foregroundColor(.white)
                            }
                            .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        }
                        .background(Color.blue)
                        .cornerRadius(10)
                        .alert("Reset Password Email Sent", isPresented: $showSuccessfulAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                        
                        Spacer()
                        
                        //MARK: Back to Login View
                        //TODO: Make pop back to the root
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Back to Login")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    Spacer()
                    
                }
            }
        }
        .navigationTitle("Reset Password")
        
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ResetPasswordView()
}
