//
//  Indieplus_PohangApp.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/15.
//

import SwiftUI

@main
struct Indieplus_PohangApp: App {
//    let model = PosterDataModel()
    let movie = TheaterManager()
    var body: some Scene {
        WindowGroup {
//            PosterView(model: model)
//            MainView()
//            TheaterManager()
            DatePickerView()
//            MovieDetailView()
        }
    }
}
