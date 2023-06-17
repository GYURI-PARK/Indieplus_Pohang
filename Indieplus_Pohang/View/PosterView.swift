//
//  PosterView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct PosterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                Spacer()
                // 현재 상영하고 있는 영화의 수만큼 반복
                ForEach(0..<10) {_ in
                    Spacer(minLength: 15)
                    Rectangle()
                        .frame(width: 186, height: 255)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                }
                
                Spacer()
            }
        }
    }
}


struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
    }
}
