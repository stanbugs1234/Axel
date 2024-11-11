//
//  NewsView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 3/10/24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 10, id: \.self) { news in
                        Rectangle()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NewsView()
    }
}
