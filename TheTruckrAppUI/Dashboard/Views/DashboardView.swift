//
//  DashboardView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/13/23.
//

import SwiftUI
import Charts

struct DashboardView: View {
    var date = Date().dateDisplayFormat
    
    var body: some View {
        VStack {
            //MARK: Dashboard Header
            HStack {
                Text("Dashboard")
                    .font(.title)
                
                Spacer()
                
                Text(String(date))
            }
            .foregroundColor(.themeGreen)
            .fontWeight(.semibold)
            
            //MARK: Account Overview
            ZStack {
               Rectangle()
                    .frame(width: .infinity, height: 225)
                    .cornerRadius(10)
                    .foregroundColor(.backgroundColor)
                HStack {
                    Text("Account")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.opposite)
                        .offset(y: -85)
                    
                    Spacer()
                }
                .padding()

            }
            .padding(.top)
            
            //MARK: Drivers Overview
            ZStack {
               Rectangle()
                    .frame(width: .infinity, height: 225)
                    .cornerRadius(10)
                    .foregroundColor(.backgroundColor)
                HStack {
                    Text("Driver")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.opposite)
                        .offset(y: -85)
                    
                    Spacer()
                }
                .padding()

            }
            .padding(.top)
            //MARK: Job Overview
            
            //MARK: Customer Overview
            
            Spacer()
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
