//
//  LocationSearchView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/10/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            //Header View
            HStack {
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color.backgroundColor)
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //List View
            LocationSearchResultsView(viewModel: viewModel, config: .ride)
            
        }
        .background(Color.backgroundColor)
        .background(.white)
    }
}
    
    struct LocationSearchView_Previews: PreviewProvider {
        static var previews: some View {
            LocationSearchView()
                .environmentObject(HomeViewModel())
        }
    }

