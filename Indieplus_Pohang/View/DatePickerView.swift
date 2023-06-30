//
//  DatePickerView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/18.
//

import SwiftUI

struct DatePickerView: View {
    @State var selectedIndex: Int = 0
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
    let today = Date()
    @State var selectedIndex = 0
    
    // 몇월인지
    
    // 며칠인지
    
    // 날짜 변환
    func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = dateFormatter.string(from: date)
        
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
            return false
        }
    }
    
    var body: some View {
        ForEach(0..<12) { index in
            
            let date = Calendar.current.date(byAdding: .day, value: index, to: today)!
            
            if !isTodayHoliday(date: date) {
                Spacer(minLength: 10)
                Button {
                    selectedIndex = index
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
        }
    }
}
struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
