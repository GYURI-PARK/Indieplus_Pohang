//
//  WrapperView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import SwiftUI

struct WrapperView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MovieTitlePickerController {
        return MovieTitlePickerController()
    }

    func updateUIViewController(_ uiViewController: MovieTitlePickerController, context: Context) {
        // Update the view controller if needed
    }
}

