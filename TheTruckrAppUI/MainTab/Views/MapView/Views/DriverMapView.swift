//
//  DriverMapView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/30/23.
//

import SwiftUI
import MapKit

struct DriverMapView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack{
            ScrollView {
                List {
                    
                }
            }
            
        }
    }
}

struct DriverMapView_Previews: PreviewProvider {
    static var previews: some View {
        DriverMapView()
    }
}
