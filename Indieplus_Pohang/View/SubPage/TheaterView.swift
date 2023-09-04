//
//  TheaterView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/29.
//

import SwiftUI

struct TheaterView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView{
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [.black, Color.main, .black ]),
                        startPoint: .init(x: 0.5, y: 0.5),
                        endPoint: .init(x: 0.5, y: 2.5)
                    ))
                    .ignoresSafeArea()
                
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 80) {
                        
                        Spacer()
                        
                        MainStoryView()
                        
                        SubStoryView()
                        
                        FooterView()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    var backButton: some View {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundColor(Color.main)
            }
        }
}

struct MainStoryView: View {
    var body: some View {
        
        Text("스쳐 지나가는 영화가 아닌 \n 삶에서 계속되는 이야기로, \n\n 우리는 다양성을 받아들이고,\n 새로운 시각과 사유를 경험하며 \n 삶의 활력을 불어넣습니다. \n\n 평범한 일상에서 스치고 지나갔던 순간들과 \n 그 안에 존재하는 사람들의 \n 소중한 이야기를 수집하고 소장하는 곳 \n 시간을 얼어붙이고 \n 순간을 아름답게 담아내는 곳")
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .regular))
            .lineSpacing(13)
    }
}

struct SubStoryView: View {
    var body: some View {
        Text("초당 24프레임의 꿈을 꾸죠 \n 생생하고 따뜻하게 때론 생경하게")
            .foregroundColor(.main)
            .font(.system(size: 18, weight: .semibold))
            .lineSpacing(13)
            .multilineTextAlignment(.center)
    }
}

struct FooterView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image("Bottomlogo")
            
            VStack(alignment: .leading, spacing: 10) {
             
                Text("경상북도 포항시 북구 중앙동 서동로 83")
                    .foregroundColor(.white)
                    .font(.system(size: 13))
                    
               
                
                Text("054-231-6586")
                    .foregroundColor(.white)
                    .font(.system(size: 13))

            }
        }
    }
}

struct TheaterView_Previews: PreviewProvider {
    static var previews: some View {
        TheaterView()
    }
}
