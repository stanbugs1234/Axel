//
//  LoginView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/12/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
//    @State private var navPath: [String] = []
    
    var body: some View {
        NavigationStack(){
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack(){
                    //MARK: Login & Image
                    VStack(spacing: 8) {
//                        Image - Need to come up with an image
                        //Title
                        Text("HAULR")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        
                    }
                    .padding(.top, 5)
                    Spacer()
                    
                    //Input Fields
                    VStack(spacing: 32) {
                        //input field 1
                        CustomInputField(text: $viewModel.email,
                                         title: "Email Address",
                                         placeholder: "name@example.com")
                        .keyboardType(.emailAddress)
                        
                        
                        //input field 2
                        CustomInputField(text: $viewModel.password,
                                         title: "Password",
                                         placeholder: "Enter your Password",
                                         isSecureField: true)
                        
                        VStack (alignment: .leading, spacing: 2) {
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(Color.red)
                                    .font(.caption)
                                    .padding()
                            }
                        }
                        
                        
                        NavigationLink {
                            ResetPasswordView()
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size:13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    Spacer()
                    
                    //MARK: Social Sign in View
                    VStack{
                        //dividers + text
                        HStack(spacing: 24) {
                            Rectangle()
                                .frame(width: 76, height: 1)
                                .foregroundColor(.white)
                                .opacity(0.5)
                            
                            Text("Sign in with Social")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            Rectangle()
                                .frame(width: 76, height: 1)
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }
                        .padding()
                        
                        
                        //Signup buttons
                        HStack(spacing: 24){
                            Button {
                                
                            } label: {
                                Image("facebook-sign-in-icon")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                            }
                            
                            Button {
                                
                            } label: {
                                Image("google-sign-in-icon")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                            }
                        }
                        
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    //Sign in Button
                    Button {
                        //                        viewModel.signIn(withEmail: email, password: password)
                        Task { try await viewModel.login()} 
                    } label: {
                        HStack {
                            Text("SIGN IN")
                                .foregroundColor(.white)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    //Sign Up Button
                    
                    Spacer()
                    
                    Divider()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        
                    }
                }
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
