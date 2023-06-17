//
//  DateViewModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

class DateViewModel: ObservableObject {
    func isTodayHoliday(date: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        
        if dateFormatter.string(from: date) == "월" || dateFormatter.string(from: date) == "화" {
            return true
        } else {
            return false
        }
    }
}
