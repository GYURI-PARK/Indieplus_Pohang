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
            }
        }
    }
}

struct RandomReviewView: View {
    
    @ObservedObject var vm: DailyReviewViewModel
    @State private var review: String = ReviewDataModel.instance.reviews[0]
    @State private var index: Int = 0
    @State private var movie: String = ReviewDataModel.instance.movies[0]

    
    var body: some View {
        
        VStack{
            Text(review)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(5)
            Text(movie)
                .foregroundColor(.white)
                .font(.system(size: 13))
        }
        .onAppear {
            if vm.isSameDay == true {
                review = vm.prevReview
                index = vm.prevIndex
                movie = vm.prevMovie
            } else {
                review = vm.changeDay()
                index = ReviewDataModel.instance.reviews.firstIndex(of: review)!
                movie = ReviewDataModel.instance.movies[index]
            }
        }
    }
}

//struct DailyReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailyReviewView()
//    }
//}
