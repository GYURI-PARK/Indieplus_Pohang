//
//  TimeTableModal.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/10/23.
//

import SwiftUI

struct TimeTableModal: View {
    
    @ObservedObject private var viewModel = TimeTableModalModel()
//    @ObservedObject var moviemodel: MoviePickerViewModel
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Text("오늘 시간표")
                    .foregroundStyle(Color.white)
                    .font(.custom(FontsManager.Pretendard.bold, size: 20))
                    .padding(15)
                
                if viewModel.count == 0 {
                    Text("오늘 상영하는 영화는 없습니다.")
                        .foregroundStyle(Color.white)
                        .font(.display1)
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(0..<viewModel.count, id: \.self) { index in
                                HStack(alignment: .top, spacing: 20) {
                                    Text("\(viewModel.movieTimes[index])")
                                        .font(.modal_txt)
                                        .foregroundStyle(Color.main)
                                    
                                    Text("\(viewModel.movieTitles[index])")
                                        .font(.modal_txt)
                                        .foregroundStyle(Color.main)
                                }
                                .padding(.bottom, 10)
                            }
                        }
                    }
                }
                
            }
        }
        .onAppear {
            viewModel.getMovieDetail()
            viewModel.updateCount()
        }
    }
}

//#Preview {
//    TimeTableModal()
//}
