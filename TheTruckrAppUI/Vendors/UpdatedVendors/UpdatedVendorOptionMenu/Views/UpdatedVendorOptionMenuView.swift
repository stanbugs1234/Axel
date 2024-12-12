//
//  UpdatedVendorOptionMenuView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/21/24.
//

import SwiftUI

struct UpdatedVendorOptionMenuView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ForEach(VendorOptionMenuEnum.allCases) { viewModel in
                Button {
                    dismiss()
                } label: {
                    VendorOptionRowView(viewModel: viewModel)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        UpdatedVendorOptionMenuView()
            .preferredColorScheme(.dark)
    }
}
