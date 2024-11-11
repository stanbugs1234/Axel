//
//  NoEntriesView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 11/13/23.
//

import SwiftUI

struct NoEntriesView: View {
    var text: String
    
    var body: some View {
        ZStack {
            Image(systemName: "circle.slash")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.red)
                .frame(width: 50, height: 50, alignment: .center)
        }
        VStack {
            HStack {
                Text("No \(text) Entries")
            }
            .padding()
            
            Text("Please press the + sign to add a \(text)")
        }
        .foregroundColor(.themeGreen)
    }
}

#Preview {
    NoEntriesView(text: "Vendor")
}
