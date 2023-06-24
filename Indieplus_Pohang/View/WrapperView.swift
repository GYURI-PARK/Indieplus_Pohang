//
//  WrapperView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import SwiftUI

struct WrapperView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MoviePickerViewController {
        return MoviePickerViewController()
    }
    
    func updateUIViewController(_ uiViewController: MoviePickerViewController, context: Context) {
        // Update the view controller if needed
    }
}
