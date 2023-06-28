//
//  Indieplus_PohangApp.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/15.
//

import SwiftUI

@main
struct Indieplus_PohangApp: App {
    let viewController = PosterViewController()
    var body: some Scene {
        WindowGroup {
            PosterView(viewController: viewController)
        }
    }
}
