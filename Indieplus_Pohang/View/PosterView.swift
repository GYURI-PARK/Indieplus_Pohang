//
//  PosterView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct PosterView: View {
    @ObservedObject var viewController: PosterViewController
//    var model = PosterDataModel

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                ForEach(0..<viewController.movieCount, id: \.self) { index in
                    
                    Spacer(minLength: 15)
                    Rectangle()
                        .frame(width: 186, height: 255)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                }
                Spacer()
            }
        }.onAppear {
            // PosterViewController에서 데이터를 가져오는 작업을 시작합니다.
            viewController.fetchHTMLParsingResult()
        }
    }
}



struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        let viewController = PosterViewController()
        PosterView(viewController: viewController)
    }
}
