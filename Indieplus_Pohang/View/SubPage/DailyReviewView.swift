//
//  DailyReviewView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct DailyReviewView: View {
    
    @StateObject var vm: DailyReviewViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Daily REVIEW")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .semibold))
            
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.main)
                    .opacity(0.5)
                    .frame(width: 330, height: 100)
                
                RandomReviewView(vm: vm)
                    .frame(width: 310, height: 90)
//                    .onChange(vm.$isChanged) { newValue in
//                        print(newValue)
//                    }
            }
        }
    }
}

struct RandomReviewView: View {
    
    @ObservedObject var vm: DailyReviewViewModel
    
    var body: some View {
        let review = ReviewDataModel.instance.reviews.randomElement()
        let index = ReviewDataModel.instance.reviews.firstIndex(of: review ?? "")
        let movie = ReviewDataModel.instance.movies[index ?? 0]
        
        VStack{
            Text(review ?? "")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(5)
            Text(movie)
                .foregroundColor(.white)
                .font(.system(size: 13))
        }
    }
}

//struct DailyReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyReviewView()
//    }
//}
