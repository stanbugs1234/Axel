//
//  ActiveSegmentedControl.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/22/24.
//

import SwiftUI

enum ActiveSegmentedControl: String, CaseIterable {
    case active = "Active"
    case inactive = "Inactive"
    
    var title: String  {
        switch self {
        case .active: return "Active"
        case .inactive: return "Inactive"
        }
    }
}

struct ActiveSegmentedControlView: View {
    @State private var selectedSide: ActiveSegmentedControl = .active
    
    var body: some View {
        Picker("", selection: $selectedSide) {
            ForEach(ActiveSegmentedControl.allCases, id: \.self) {
                Text($0.title.description)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

#Preview {
    ActiveSegmentedControlView()
}
