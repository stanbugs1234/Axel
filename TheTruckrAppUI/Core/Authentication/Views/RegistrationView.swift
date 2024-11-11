//
//  RegistrationView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/12/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .imageScale(.medium)
                        .padding()
                }
                
                Text("Create New Account")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250)
                
                Spacer()
                Spacer()
                
                VStack{
                    VStack(spacing: 56) {
                        CustomInputField(text: $viewModel.fullName,
                                         title: "Full Name",
                                         placeholder: "Enter Your Name")
                        
                        CustomInputField(text: $viewModel.email,
                                         title: "Email Address",
                                         placeholder: "name@example.com")
                        
                        CustomInputField(text: $viewModel.password,
                                         title: "Create Password",
                                         placeholder: "Enter Your Password", isSecureField: true)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button {
                        Task {
                            try await viewModel.createUser()
                        }
                    } label: {
                        HStack {
                            Text("SIGN UP")
                            
                            Image(systemName: "arrow.right")
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    }
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                
                Spacer()
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
