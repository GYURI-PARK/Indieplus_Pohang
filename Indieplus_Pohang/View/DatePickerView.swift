//
//  DatePickerView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct DatePickerView: View {
//    @State var selectedIndex: Int = 0
    @ObservedObject var theatermodel: TheaterManager
    @ObservedObject var moviemodel: MovieManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Spacer()
    
                DateView(theatermodel: theatermodel, moviemodel: moviemodel)
                
                Spacer()
            }
        }
    }
}

struct DateView: View {
    let today = Date()
    @State var selectedIndex = 0
    @State var dateList = Set<String>()
    @State var selectedDate = ""
    
    @StateObject var theatermodel: TheaterManager
    @StateObject var moviemodel: MovieManager
    
    @State private var count = 0
    @State private var movieTitles: [String] = []

    
    // "2023-07-01" 형태로 표시되는 날짜들만 배열에 담기
    func dateToList(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    // 날짜 변환
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        //        let day = dateFormatter.string(from: date)
        
        return dateFormatter.string(from: date)
    }
    
    // 요일 변환
    func dayToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        // 한국어로 변환
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        let calendar = Calendar.current
        
        if calendar.isDate(date, inSameDayAs: today) {
            return "오늘"
        } else {
            return dateFormatter.string(from: date)
        }
    }
    
    // 휴무일인지 판단
    func isTodayHoliday(date: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        
        if dateFormatter.string(from: date) == "월" || dateFormatter.string(from: date) == "화" {
            return true
        } else {
            DispatchQueue.main.async {
                dateList.insert(dateToList(date: date))
            }
            return false
        }
    }
    
    var body: some View {
        ForEach(0..<10) { index in
            
            let date = Calendar.current.date(byAdding: .day, value: index, to: today)!
            
            if !isTodayHoliday(date: date) {
                Spacer(minLength: 10)
                
                Button {
                    selectedIndex = index
                    selectedDate = dateToList(date: date)
                    moviemodel.getMovieDetail(date: selectedDate)
                    moviemodel.updateCount()
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                            .foregroundColor(index == selectedIndex ? .main : .clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.main)
                                    .frame(width: 60, height: 60)
                            )
                        
                        VStack(spacing: 2){
                            Text(dateToString(date: date))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(index == selectedIndex ? .black : Color.main)
                            
                            Text(dayToString(date: date))
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(index == selectedIndex ? .black : Color.main)
                        }
                    }
                }
                Spacer(minLength: 10)
            }
        }.onChange(of: selectedDate) {newValue in
//            // selectedDate 값이 변경될 때 실행되는 로직
//            print("Selected date changed: \(newValue)")
//            print("on change \(moviemodel.movieTitles.count)")
            
            // 변경된 movieTitles와 count를 MoviePickerView로 전달
            movieTitles = moviemodel.movieTitles
            count = moviemodel.count
            
        }
    }
}
