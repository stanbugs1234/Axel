//
//  DismissKeyboardButton.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 10/21/23.
//

import SwiftUI

struct DismissKeyboardButton: View {
    var body: some View {
        Button {
            Keyboard.dismissKeyboard()
        } label: {
            Image(systemName: "keyboard")
        }

    }
}

#Preview {
    DismissKeyboardButton()
}
