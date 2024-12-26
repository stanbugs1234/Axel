//
//  VendorServicesRowView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/20/24.
//

import SwiftUI

struct VendorServicesRowView: View {
    @EnvironmentObject var viewModel: UpdatedHomeViewModel
    @ObservedObject var vendorViewModel: VendorRowViewModel
    @State private var services = [Services]()
    let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
        self.vendorViewModel = VendorRowViewModel(vendor: vendor)
        self.services = vendorViewModel.services
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Services by \(vendor.vendorFullName)")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
            HStack {

                Spacer()
                
                VStack(alignment: .leading) {
                    
                    //MARK: Horizontal Scroll View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
//                            ForEach(SuggestionViewEnums.allCases){ viewModel in
                            ForEach(vendorViewModel.services){ viewModel in
                                NavigationLink {
//                                    Text("\(viewModel.title)")
//                                    ForEach(vendorViewModel.services) { viewModel in
//                                        NavigationLink {
//                                            Text("\(viewModel.title)")
                                } label: {
                                    SuggestionCardView(viewModel: viewModel.serviceCategory)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .frame(height: SizeConstants.cardThirdHeight)
                    .padding(.top)
                }
            }
            .padding(.top)
        }
        .foregroundStyle(Color.opposite)
    }
}

#Preview {
    NavigationStack {
        VendorServicesRowView(vendor: MockData.vendors[0])
            .environmentObject(UpdatedHomeViewModel())
    }
}
