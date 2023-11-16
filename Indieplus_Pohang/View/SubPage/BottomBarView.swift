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
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .frame(width: geometry.size.width, height: 98)
                    .foregroundStyle(Color.main)
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
                    }
                    .foregroundStyle(.black)
                }
                .offset(x: -130, y: -20)
                
                NavigationLink(destination: LoadingWebView(urlToLoad: "https://culturalspace.phcf.or.kr/joongangArtHall/intro.do", viewModel: viewModel)) {
                    VStack{
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                    }
                    .foregroundStyle(Color.black)
                }
                .offset(x: 130, y: -20)
                
                
                Button(action: {
                    isModalShown.toggle()
                }) {
                    ZStack{
                        Circle()
                            .foregroundStyle(.black)
                            .frame(width: 60)
                            .overlay(Circle()
                                .strokeBorder(Color.main, lineWidth: 1.3)
                                .frame(width: 60))
                        
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 28)
                            .foregroundStyle(Color.main)
                        
                    }
                }
                
                .offset(x: 0, y: -50)
                
            }
            .offset(y: geometry.size.height / 2 + Constants.bottomOffset)
            .sheet(isPresented: $isModalShown) {
                TimeTableModal()
                    .presentationDetents([.height(180)])
            }
        }
    }
}

//struct BottomBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomBarView()
//    }
//}
