//
//  BusinessHubEmailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/20/24.
//

import SwiftUI

struct BusinessHubEmailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Dismiss Button
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .padding(.horizontal)
            
            Text("What's your business email?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            //MARK: Business Email Text Box
            VStack(alignment: .leading) {
                Text("Business Email")
                
                TextField("Email", text: .constant(""))
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(10)
                    .font(.headline)
                    .foregroundColor(Color.secondary)
                    .autocapitalization(.none)
            }
            .padding(.horizontal)
            
                Spacer()
            
            Button {
                
            } label: {
                Text("Next")
                    .frame(width: SizeConstants.cardWidth - 20, height: 40, alignment: .center)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.secondary)
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        BusinessHubEmailView()
            .preferredColorScheme(.dark)
    }
}
