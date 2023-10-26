//
//  TimeTableModalModel.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/10/27.
//

import Foundation

class TimeTableModalModel: ObservableObject {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd (E)"
        
        return formatter
    }()
}
