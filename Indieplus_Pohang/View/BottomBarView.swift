//
//  BottomBarView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 400, height: 98)
                .foregroundColor(Color.main)
                .ignoresSafeArea()
            
            NavigationLink {
                TheaterView()
                    .navigationBarTitle("INDIE PLUS POHANG")
                    .navigationBarTitleDisplayMode(.inline)
            } label : {
                VStack{
                    Image(systemName: "theatermasks.fill")
                        .resizable()
                        .frame(width: 40, height: 28)
                        .padding(.top, 3)
                    
                    Text("영화관")
                        .font(.system(size: 12, weight: .bold))
                }
                .foregroundColor(.black)
            }
            .offset(x: -130, y: -20)
            
            Button {} label : {
                VStack{
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 28)
                        .padding(.top, 3)
                    
                    Text("마이")
                        .font(.system(size: 12, weight: .bold))
                }
                .foregroundColor(.black)
            }
            .offset(x: 130, y: -20)
            
            ZStack{
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 60)
                    .overlay(Circle()
                        .strokeBorder(Color.main, lineWidth: 1.3)
                        .frame(width: 60))
                
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 28)
                    .foregroundColor(.main)

            }
                    .offset(x: 0, y: -50)
            
        }
        .offset(y: 400)
        
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
