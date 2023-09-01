//
//  DailyReviewViewModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/09/01.
//

import Foundation

class DailyReviewViewModel: ObservableObject {
    
    @Published var date: Date
    @Published var isChanged: Bool = true
    var previousDate: Date
    var currentReview: String = ""

    init() {
        self.date = Date()
        self.previousDate = Date()
        self.currentReview = getRandomReview()
    }
    
    // 일자만 추출하는 함수 작성
    func isChangeDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"

        return dateFormatter.string(from: date)
    }
    
    func checkDate(day: String) -> Bool {
        if (isChangeDate(date: previousDate) != isChangeDate(date: Date())) && isChanged == true {
             isChanged = false
        }
        else if (isChangeDate(date: previousDate) != isChangeDate(date: Date())) && isChanged == false {
            isChanged = true
        }
        return isChanged
    }
    
    // random review 선택 함수
    func getRandomReview() -> String {
        return ReviewDataModel.instance.reviews.randomElement() ?? ""
    }
    
    // date가 isChangeDate(previousDate) -> isChangeDate(Date) 로 들어가 변경될때마다 업데이트
}
