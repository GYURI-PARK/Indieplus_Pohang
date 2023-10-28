//
//  BottomBarView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/17.
//

import SwiftUI

struct BottomBarView: View {
    @ObservedObject var viewModel: LoadingWebViewModel
    @ObservedObject var moviemodel: MoviePickerViewModel
    @State var isModalShown = false
    
    init(viewModel: LoadingWebViewModel, moviemodel: MoviePickerViewModel) {
        
        self.viewModel = viewModel
        self.moviemodel = moviemodel
        
        DispatchQueue.main.async {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.main)]
            
            //Use this if NavigationBarTitle is with displayMode = .inline
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.main)]
        }
    }
    
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
                    .accentColor(.main)
            } label : {
                VStack{
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36)
                    //                            .padding(.top, 3)
                    
                    //                        Text("영화관")
                    //                            .font(.system(size: 12, weight: .bold))
                }
                .foregroundColor(.black)
            }
            .offset(x: -130, y: -20)
            
            NavigationLink(destination: LoadingWebView(urlToLoad: "https://culturalspace.phcf.or.kr/joongangArtHall/intro.do", viewModel: viewModel)) {
                VStack{
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                    //                            .padding(.top, 3)
                    
                    //                        Text("마이")
                    //                            .font(.system(size: 12, weight: .bold))
                }
                .foregroundColor(.black)
            }
            .offset(x: 130, y: -20)
            
            
            Button(action: {
                isModalShown.toggle()
            }) {
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
            }
            
            .offset(x: 0, y: -50)
            
        }
        .offset(y: 400)
        .sheet(isPresented: $isModalShown) {
            TimeTableModal()
                .presentationDetents([.height(180)])
        }
    }
}

//struct BottomBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomBarView()
//    }
//}
