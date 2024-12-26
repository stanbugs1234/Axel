//
//  OrderListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/23/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct OrderListView: View {
    @ObservedObject var viewModel = OrderViewModel()
    @State private var showNewOrderView = false
    
    var body: some View {
        ScrollView {
        VStack {
            SearchBarView(text: $viewModel.searchText, placementString: "Search Orders...")
                .padding(.horizontal)
                .padding(.top)
            
            ActiveSegmentedControlView()
            
                LazyVStack {
                    ForEach(viewModel.searchableOrder) {order in
                        NavigationLink(value: order) {
                            OrderRowView(order: order)
                        }
                    }
                }
            }
            .navigationDestination(for: Order.self) { order in
                OrderDetailView(order: order)
            }
            .toolbar{
                ToolbarItem {
                    Button {
                        showNewOrderView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.themeGreen)
                    }
                    .fullScreenCover(isPresented: $showNewOrderView) {
                        CreateNewOrders()
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    DismissKeyboardButton()
                }
            }
            Spacer()
        }
        .navigationTitle("Orders")

    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderListView(viewModel: OrderViewModel())
        }
    }
}
