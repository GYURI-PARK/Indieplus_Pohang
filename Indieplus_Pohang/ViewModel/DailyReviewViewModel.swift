//
//  DailyReviewViewModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/09/01.
//

import Foundation

class DailyReviewViewModel: ObservableObject {
    
    @Published var isSameDay: Bool = false
    @Published var prevMovie: String = ReviewDataModel.instance.movies[0]
    @Published var prevIndex: Int = 0
    @Published var prevReview: String = ReviewDataModel.instance.reviews[0]
    @Published var nowMovie: String = ReviewDataModel.instance.movies[0]
    @Published var nowIndex: Int = 0
    @Published var nowReview: String = ReviewDataModel.instance.reviews[0]
    @Published var prev: DateFormatter
    @Published var today: DateFormatter
    
    init() {
        self.prev = DateFormatter()
        self.today = DateFormatter()
    }
    
    private func formatTime(date: DateFormatter) -> DateFormatter {
        date.dateFormat = "dd"
        return date
    }
    
    private func getTimeAsString(date: DateFormatter) -> String {
        return date.string(from: Date())
    }
    
    func checkDay() -> Bool {
        if getTimeAsString(date: formatTime(date: prev)) == getTimeAsString(date: formatTime(date: today)) {
            isSameDay = true
        } else {
            isSameDay = false
            prev = formatTime(date: today)
        }
        return isSameDay
    }
    
    // 날짜가 다를경우 checkDay = false
    func changeDay() ->  String {
        prevMovie = nowMovie
        prevIndex = nowIndex
        prevReview = nowReview
        
        nowReview = ReviewDataModel.instance.reviews.randomElement()!
        nowIndex = ReviewDataModel.instance.reviews.firstIndex(of: nowReview)!
        nowMovie = ReviewDataModel.instance.movies[nowIndex]
        
        return nowReview
    }
}
