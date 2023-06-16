//
//  MoviePickerView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/16.
//

import SwiftUI

struct MoviePickerView: View {
    var body: some View {
        VStack(spacing: 30){
            ForEach(0..<4) { index in
                HStack{
                    Spacer()
                    
                    VStack{
                        Circle()
                            .frame(width: 15)
                            .foregroundColor(Color(0xEF865B))
                        
                        
                        Rectangle()
                            .frame(width: 1, height: 50)
                            .foregroundColor(Color(0xEF865B))
                        
                    }
                    Spacer()
                    
                        // 영화시간 + 영화제목 + 예매하기 버튼
                        MovieSummaryInfoView()
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color(0xEF865B))
                                    .frame(width: 300, height: 80)
                                )
                    
                    Spacer()
                }
            }
        }
    }
}

struct MovieSummaryInfoView: View {
    var body: some View {
        HStack {
            Text("10 : 00")
                .foregroundColor(.white)
            
            VStack(alignment: .leading){
                Text("슬픔의 삼각형")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                
                Text("Triangle of Sadness, 2023")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            
            Text("예매\n하기")
                .foregroundColor(.white)
        }
    }
}

struct MoviePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePickerView()
    }
}
