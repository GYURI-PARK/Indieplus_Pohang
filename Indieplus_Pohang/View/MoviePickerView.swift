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
    @ObservedObject var moviemodel: MovieManager

    @State private var count = 0
    @State private var movieTitles: [String] = []

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
            ForEach(0..<moviemodel.count, id: \.self) { index in
                HStack(spacing: 20){
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
                    MovieSummaryInfoView(selectedTime: presentingDifferentTime(index: index), theatermodel: theatermodel, moviemodel: moviemodel, index: index)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.main)
                                .frame(width: 300, height: 80)
                        )
                }
            }
            .onReceive(moviemodel.$movieTitles) { _ in
                DispatchQueue.main.async {
                    self.movieTitles = moviemodel.movieTitles
                    self.count = moviemodel.count
                }
            }
            .onAppear {
                let today = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = dateFormatter.string(from: today)
                moviemodel.getMovieDetail(date: dateString)
                DispatchQueue.main.async {
                    moviemodel.updateMovieTitles(newTitles: moviemodel.movieTitles)
                }
            }
        }
    }
}


struct MovieSummaryInfoView: View {

    var selectedTime: String
    @ObservedObject var theatermodel: TheaterManager
    @ObservedObject var moviemodel: MovieManager
    var index: Int

    var body: some View {
        HStack(spacing: 10) {
            Text("\(selectedTime)")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))
                .padding(.trailing, 3)

            VStack(alignment: .leading, spacing: 8){
                Button(action: {
                    // 영화 제목 클릭 시 실행될 동작
                }) {
                    // 날짜와 순서 인덱스를 받으면 자동으로 영화제목 출력하게끔
                    if index < moviemodel.movieTitles.count {
                        Text("\(moviemodel.movieTitles[index])")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                    } else {
                        Text("Invalid Index")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                    }
                }

                Text("Triangle of Sadness, 2023")
                    .font(.system(size: 12))
                    .opacity(0.7)
                    .foregroundColor(.white)
            }
            Button(action: {
                            // 예매 버튼 클릭 시 실행될 동작
            }) {
                Text("예매\n하기")
                    .foregroundColor(.white)
                    .padding(.leading)
            }
        }
    }
}
