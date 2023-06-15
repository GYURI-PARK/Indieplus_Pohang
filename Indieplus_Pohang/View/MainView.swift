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
            
            Color.black.ignoresSafeArea()
            
            ScrollView(){
                VStack {
                    ZStack{
                        Rectangle().foregroundColor(.green)
                        
                        VStack{
                            Image("Toplogo")
                            
                            titleText()
                            
                            posterView()
                            
                            Divider().frame(width: 300)
                        }
                    }
                    
                    datePickerView()
                    
                }
            }
        }
    }
}

struct titleText: View {
    var body: some View {
        
        HStack{
            
            Text("초당 24프레임")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Text("의 꿈을 꾸는 곳")
                .font(.system(size: 15, weight: .regular))
                .foregroundColor(.white)
            
        }
    }
}

struct posterView: View {
    var body: some View {
        ScrollView(.horizontal) {
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

struct datePickerView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                Spacer()
                ForEach(0..<9) {_ in
                    Spacer(minLength: 15)
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                }
                
                Spacer()
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
