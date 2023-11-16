//
//  MoviePickerView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/16.
//
//
import SwiftUI

struct MoviePickerView: View {
    @State var selectedTime = ""

    @ObservedObject var theatermodel: TheaterManager
    @ObservedObject var moviemodel: MoviePickerViewModel
    @ObservedObject var vm: LoadingWebViewModel

    @State private var count = 0

    func presentingDifferentTime(index: Int) -> String {
        if index == 0 {
            return "10 : 00"
        } else if index == 1 {
            return "13 : 30"
        } else if index == 2 {
            return "16 : 30"
        } else if index == 3 {
            return "19 : 30"
        }
        return ""
    }

    var body: some View {
        VStack(spacing: 30){
            if moviemodel.count == 0 {
                Text("상영 시간표 준비 중입니다.")
                    .foregroundColor(.white)
                    .padding(20)
            }
            else {
                ForEach(0..<moviemodel.count, id: \.self) { index in
                    HStack(spacing: 10){
                        VStack{
                            Circle()
                                .frame(width: 15)
                                .foregroundColor(.clear)
                                .overlay(
                                    Circle()
                                        .strokeBorder(Color.main)
                                        .frame(width: 15))
                            
                            Rectangle()
                                .frame(width: 1, height: 60)
                                .foregroundColor(Color.main)
                        }
                        
                        MovieSummaryInfoView(selectedTime: presentingDifferentTime(index: index), theatermodel: theatermodel, moviemodel: moviemodel, vm: vm, index: index)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.main)
                                    .frame(width: 320, height: 80)
                            )
                    }
                }
            }
        }
    }
}


struct MovieSummaryInfoView: View {

    var selectedTime: String
    @ObservedObject var theatermodel: TheaterManager
    @ObservedObject var moviemodel: MoviePickerViewModel
    @ObservedObject var vm: LoadingWebViewModel
    
    var index: Int

    var body: some View {
        HStack(spacing: 10) {
            
            if index < moviemodel.movieTimes.count {
                Text("\(moviemodel.movieTimes[index])")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 5)
                    .frame(width: 60)
            } else {
                Text("Invalid Index")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 5)
                    .frame(width: 60)
            }
            
            VStack(alignment: .leading, spacing: 8){
                Button(action: {
                    // 영화 제목 클릭 시 실행될 동작
                }) {
                    if index < moviemodel.movieTitles.count {
                        Text("\(moviemodel.movieTitles[index])")
                            .lineLimit(1)
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 150, alignment: .leading)
                    } else {
                        Text("Invalid Index")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 150, alignment: .leading)
                    }
                }
                if index < moviemodel.movieEngTitles.count {
                    Text("\(moviemodel.movieEngTitles[index])")
                        .lineLimit(1)
                        .font(.system(size: 12))
                        .opacity(0.7)
                        .foregroundColor(.white)
                        .frame(width: 150, alignment: .leading)
                } else {
                    Text("Invalid Index")
                        .font(.system(size: 12))
                        .opacity(0.7)
                        .foregroundColor(.white)
                        .frame(width: 150, alignment: .leading)
                }
            }
            
            NavigationLink(destination: LoadingWebView(urlToLoad: "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057", viewModel: vm)) {
                Text("예매\n하기")
                    .foregroundColor(.white)
                    .frame(width: 70)
                    .padding(.leading, 10)
            }
        }
    }
}
