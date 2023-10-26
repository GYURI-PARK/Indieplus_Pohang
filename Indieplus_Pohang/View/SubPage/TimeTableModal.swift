//
//  TimeTableModal.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/10/23.
//

import SwiftUI

struct TimeTableModal: View {
    
    @ObservedObject private var viewModel = TimeTableModalModel()
    @ObservedObject var moviemodel: MoviePickerViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text(Date(), formatter: TimeTableModalModel.dateFormatter)
                    .foregroundStyle(Color.white)
                    .font(.display1)
                    .padding(15)
                
                if moviemodel.count == 0 {
                    Text("오늘 상영하는 영화는 없습니다.")
                        .foregroundStyle(Color.white)
                        .font(.display1)
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(0..<moviemodel.count, id: \.self) { index in
                                HStack(alignment: .top) {
                                    Text("\(moviemodel.movieTimes[index])")
                                        .font(.subhead2_1)
                                        .foregroundStyle(Color.main)
                                    
                                    Text("\(moviemodel.movieTitles[index])")
                                        .font(.subhead2_1)
                                        .foregroundStyle(Color.main)
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
}

//#Preview {
//    TimeTableModal()
//}
