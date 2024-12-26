//
//  TripListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/25/23.
//

import SwiftUI
import UIKit

struct TripListView: View {
    @ObservedObject var viewModel = ReservationViewModel()
    var body: some View {
        VStack {
            SearchBarView(text: $viewModel.searchText, placementString: "Search Trips")
                .padding()
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.searchableTrips) { trip in
                        NavigationLink(value: trip) {
                            TripListRowView(trip: trip)
                        }
                    }
                    
                    Spacer()
                }
            }
            
//            lazy var tableView: UITableView = {
//                let tv = UITableView(frame: self.view.frame, style: .grouped)
//                tv.delegate = self
//                tv.translatesAutoresizingMaskIntoConstraints = false
//                tv.register()
//                ForEach(viewModel.searchableTrips) { trip in
//                    NavigationLink(value: trip) {
//                        TripListRowView(trip: trip)
//                    }
//                }
//            }
        }
        .navigationDestination(for: Trip.self, destination: { trip in
            TripDetailView(trip: trip)
        })
        .navigationTitle("Trips")
    }
}

struct TripListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TripListView()
        }
    }
}
