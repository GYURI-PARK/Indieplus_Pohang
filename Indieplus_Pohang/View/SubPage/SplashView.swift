//
//  SplashView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/10/29.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MainView()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()
                
                Image("splashlogo")
                    .offset(x: 0, y: -50)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
