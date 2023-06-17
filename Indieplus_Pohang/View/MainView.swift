//
//  MainView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/15.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Color.main, .black ]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.5)
                ))
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack(spacing: 50) {
                    Group{
                        VStack{
                            Spacer(minLength: 20)
                            
                            Image("Toplogo")
                            
                            Spacer(minLength: 20)
                            
                            titleText()
                            
                            Spacer(minLength: 40)
                            
                            posterView()
                            
                            Spacer(minLength: 20)
                            
                        }
                        
                        Divider()
                            .frame(width: 350, height: 1)
                            .background(Color.main)
                        
                        
                        DatePickerView()
                        
                        
                        MoviePickerView()
                        
                        
                        DailyReviewView()
                    }
                }
            }
            
            FastTicketingView()
                .offset(x: 151, y: 340)
        }
    }
}

struct titleText: View {
    var body: some View {
        
        HStack{
        
            let combinedText = Text("초당 24프레임")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black) +
                Text("의 꿈을 꾸는 곳")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.black)
            
            Text("\(combinedText)")
            
        }
    }
}

struct posterView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                Spacer()
                // 현재 상영하고 있는 영화의 수만큼 반복
                ForEach(0..<10) {_ in
                    Spacer(minLength: 15)
                    Rectangle()
                        .frame(width: 186, height: 255)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                }
                
                Spacer()
            }
        }
    }
}

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

// datePicker안에 있는 사각형
struct DateView: View {
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
        ForEach(0..<8) { index in
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
            
                    let date = Calendar.current.date(byAdding: .day, value: index, to: today)!
                    
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



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
