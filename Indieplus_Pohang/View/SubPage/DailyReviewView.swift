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
            //            Text("Take It Easy")
            //                .foregroundColor(.white)
            //                .font(.subhead3_1)
            //                .padding(.bottom, 10)
            //
            //            ZStack{
            //                RoundedRectangle(cornerRadius: 15)
            //                    .foregroundColor(Color.main)
            //                    .opacity(0.5)
            //                    .frame(width: 330, height: 100)
            
            RandomReviewView(vm: vm)
                .frame(width: 310)
                .padding(.horizontal, 25)
                .padding(.vertical, 10)
                .background (
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.main)
                        .opacity(0.5)
                )
            //            }
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
                .font(.body3)
                .lineSpacing(10)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(8)
                
            Text(movie)
                .foregroundColor(Color(0xCECECE))
                .font(.subhead1)
                .padding(.bottom, 5)
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
