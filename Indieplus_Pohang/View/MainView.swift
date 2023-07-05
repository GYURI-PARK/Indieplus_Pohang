//
//  MainView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/15.
//

import SwiftUI
import UIKit

struct MainView: View {
    let posterModel = PosterDataModel()
    let movieModel = MovieManager()
    let theaterModel = TheaterManager()
    
    var body: some View {
        NavigationView{
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
                                
                                
                                PosterView(model: posterModel)
                                
                                Spacer(minLength: 20)
                                
                            }
                            
                            Divider()
                                .frame(width: 350, height: 1)
                                .background(Color.main)
                            
                            
                            DatePickerView()
                            
                            
                            MoviePickerView(theatermodel: theaterModel, moviemodel: movieModel)
                            
                            
                            DailyReviewView()
                            
                            Spacer(minLength: 45)
                        }
                    }
                }
                
                FastTicketingView()
                
                BottomBarView()
            }
        }
        .accentColor(.main)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
