//
//  PosterView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct PosterView: View {
    var model: PosterDataModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                ForEach(0..<3) { _ in
                    Text("fsdfsf")
                  
//                    Spacer(minLength: 15)
//                    Rectangle()
//                        .frame(width: 186, height: 255)
//                        .cornerRadius(15)
//                        .foregroundColor(.white)
//                    Spacer(minLength: 15)
                }
                Spacer()
            }
        }
//        .onAppear {
//            if !model.isDataLoaded {
//                model.fetchData { error in
//                    if let error = error {
//                        print("Error fetching data: \(error)")
//                    }
//                }
//            }
//        }
    }
}



struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(model: PosterDataModel())
    }
}
