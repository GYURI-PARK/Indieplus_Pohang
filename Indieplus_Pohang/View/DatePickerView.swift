//
//  DatePickerView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct DatePickerView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Spacer()
                
                DateView()
                
                Spacer()
            }
        }
    }
}

struct DateView: View {
    @StateObject private var viewModel = DateViewModel()
    let today = Date()
    // 날짜 변환
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
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
    
    var body: some View {
        ForEach(0..<12) { index in
            
            let date = Calendar.current.date(byAdding: .day, value: index, to: today)!
            
            if !viewModel.isTodayHoliday(date: date) {
                Spacer(minLength: 10)
                ZStack{
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                        .foregroundColor(.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.main)
                                .frame(width: 60, height: 60)
                        )
                    
                    VStack(spacing: 2){
                        
                        Text(dateToString(date: date))
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.main)
                        
                        
                        Text(dayToString(date: date))
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color.main)
                        
                    }
                }
                Spacer(minLength: 10)
            }
        }
    }
}
struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
