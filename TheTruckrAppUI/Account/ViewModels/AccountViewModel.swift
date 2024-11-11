//
//  AccountViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/21/24.
//

import Foundation
import SwiftUI
import PhotosUI

class AccountViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {Task { try await loadImage() } }
    }
    
    @Published var profileImage: Image?
    
    @MainActor
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
