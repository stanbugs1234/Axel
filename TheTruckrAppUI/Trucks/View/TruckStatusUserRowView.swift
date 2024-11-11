//
//  TruckStatusUserRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 2/14/24.
//

import SwiftUI

struct TruckStatusUserRowView: View {
    let user: User
    
    var body: some View {
        VStack(){
            //MARK: User Header
            HStack{
                ButtonImageFactored(size: .small, image: .driver, text: " ")
                
                Text("Driver Details")
            }
            .font(.title2)
            .fontWeight(.bold)
            
            Divider()
            
            VStack {
                //MARK: Driver Name & Rating
                HStack{
                    Text("User:")
                    
                    Text(user.fullname)
                    
                    Spacer()
                    
                    Text("4.7")
                        .font(.footnote)
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.yellow)
                        .imageScale(.small)
                }
                .padding(.top, 2)
                
                //MARK: User Medical Information
                HStack{
                    Text("License:")
                    
                    Text("1220321")
                    
                    Spacer()
                    
                    Text("Expiration Date: ")
                        .font(.footnote)
                    
                    Text("2027")
                }
                .padding(.top, 2)
                
                HStack{
                    Text("Medical:")
                    
                    Text("M1220321")
                    
                    Spacer()
                    
                    Text("Expiration Date: ")
                    
                    Text("2025")
                }
                .padding(.top, 2)
                
                HStack{
                    Text("Insurance:")
                    
                    Text("M1220321")
                    
                    Spacer()
                    
                    Text("Expiration Date: ")
                    
                    Text("2025")
                }
                .padding(.top, 2)
            }
            .padding(.top, 5)
        }
        .font(.footnote)
    }
}


struct TruckStatusUserView_Previews: PreviewProvider {
    static var previews: some View {
        TruckStatusUserRowView(user: dev2.mockUser)
    }
}
