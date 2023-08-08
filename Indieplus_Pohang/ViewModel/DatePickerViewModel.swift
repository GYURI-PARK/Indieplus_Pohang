//
//  DatePickerViewModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/08/08.
//

import Foundation

class DatePickerViewModel: ObservableObject {
    
    let today = Date()
    var selectedIndex = 0
    var dateList = Set<String>()
    var selectedDate = ""
    
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
                self.dateList.insert(self.dateToList(date: date))
            }
            return false
        }
    }
}
