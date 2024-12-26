//
//  SaveButtonView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/5/23.
//

import SwiftUI

struct ButtonView: View {
    let size: ButtonSize
    
    let buttonString: String
    
    var body: some View {
        Text(buttonString)
            .bold()
            .font(size.fontSize)
            .frame(width: size.width, height: size.height, alignment: .center)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.backgroundColor)
            .background(Color.opposite)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: .primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(size: .medium, buttonString: "Save")
    }
}
