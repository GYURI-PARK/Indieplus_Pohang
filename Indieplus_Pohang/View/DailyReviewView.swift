//
//  DailyReviewView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct DailyReviewView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily REVIEW")
                .foregroundColor(.white)
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.main)
                    .opacity(0.5)
                    .frame(width: 330, height: 120)
            }
        }
    }
}

struct DailyReviewView_Previews: PreviewProvider {
    static var previews: some View {
        DailyReviewView()
    }
}
