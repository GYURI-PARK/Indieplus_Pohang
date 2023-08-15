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
    @ObservedObject var moviemodel: MoviePickerViewModel
    @ObservedObject var datemodel: DatePickerViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Spacer()
    
                DateView(theatermodel: theatermodel, moviemodel: moviemodel, datemodel: datemodel)
                
                Spacer()
            }
        }
    }
}

struct DateView: View {
    let today = Date()
    @State var selectedIndex = 0
    @State var selectedDate = ""
    
    @StateObject var theatermodel: TheaterManager
    @StateObject var moviemodel: MoviePickerViewModel
    @StateObject var datemodel: DatePickerViewModel
    
    @State private var count = 0
    @State private var movieTitles: [String] = []
    
    var body: some View {
        ForEach(0..<10) { index in
            
            let date = Calendar.current.date(byAdding: .day, value: index, to: today)!
            
            if !datemodel.isTodayHoliday(date: date) {
                Spacer(minLength: 10)
                
                Button {
                    selectedIndex = index
                    selectedDate = datemodel.dateToList(date: date)
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
                            Text(datemodel.dateToString(date: date))
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(index == selectedIndex ? .black : Color.main)
                            
                            Text(datemodel.dayToString(date: date))
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(index == selectedIndex ? .black : Color.main)
                        }
                    }
                }
                Spacer(minLength: 10)
            }
        }
        .onAppear {
            selectedDate = datemodel.dateToList(date: today)
            moviemodel.getMovieDetail(date: selectedDate)
            moviemodel.updateCount()
        }
//        .onChange(of: selectedDate) {newValue in
//
//            movieTitles = moviemodel.movieTitles
//            count = moviemodel.count
//
//        }
    }
}
