//
//  ScheduledLocationResultView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/13/24.
//

import SwiftUI

struct ScheduledLocationResultView: View {
    @ObservedObject var viewModel: TripsViewModel
    let config: LocationResultsViewConfig
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                ForEach(viewModel.results, id: \.self) {
                    result in
                    LocationSearchResultsCell(title: result.title, subTitle: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectLocation(result, config: config)
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ScheduledLocationResultView(viewModel: TripsViewModel(), config: .ride)
}
