//
//  PosterView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct PosterView: View {
    
    @ObservedObject var model: PosterViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                Spacer()
                ForEach(0..<model.movieCount, id: \.self) { index in
                    
                    Spacer(minLength: 15)
                    
                    Button {} label :  {
                        AsyncImage(url: URL(string: model.movieData[index]["imgSource"] ?? "" )) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 186, height: 255)
                                .cornerRadius(15)
                        } placeholder: {
                            ZStack {
                                Rectangle()
                                    .foregroundStyle(Color(0xCECECE))
                                    .frame(width: 186, height: 255)
                                    .cornerRadius(15)
                                
                                ProgressView()
                                    .foregroundStyle(Color.main)
                            }
                        }
                        Spacer(minLength: 15)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            Task {
                model.fetchHTMLParsingResult()
            }
        }
//        .onAppear {
//            model.fetchHTMLParsingResult()
//        }
//        .task {
//            await model.fetchHTMLParsingResult()
//        }
    }
}



//struct PosterView_Previews: PreviewProvider {
//    static var previews: some View {
//        let model = PosterDataModel()
//        PosterView(model: model)
//    }
//}
