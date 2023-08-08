//
//  MovieDetailView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/30.
//

import SwiftUI

//struct MovieDetailView: View {
////    @ObservedObject var moviemodel: TheaterManager
//    @StateObject var moviemodel = TheaterManager()
//    @State private var selectedShowseqlist: Showseqlist? = nil
//
////    private func makeMovieForm() -> some View {
////        if let firstShowseqlist = moviemodel.showseqlist.first {
////            selectedShowseqlist = Showseqlist(
////                PlaySDT: firstShowseqlist.PlaySDT,
////                StartTime: firstShowseqlist.StartTime,
////                EndTime: firstShowseqlist.EndTime,
////                CinemaCd: firstShowseqlist.CinemaCd,
////                MovieCd: firstShowseqlist.MovieCd,
////                RatingNm: firstShowseqlist.RatingNm,
////                PosterGuID: firstShowseqlist.PosterGuID,
////                Url: firstShowseqlist.Url,
////                MovieNm: firstShowseqlist.MovieNm,
////                RunningTime: firstShowseqlist.RunningTime,
////                MovieNmEng: firstShowseqlist.MovieNmEng,
////                TotalSeatCnt: firstShowseqlist.TotalSeatCnt,
////                RemainSeatCnt: firstShowseqlist.RemainSeatCnt,
////                ShowSeq: firstShowseqlist.ShowSeq
////            )
////        }
////        return EmptyView() // 실제로 반환할 값이 없는 경우, 적절한 뷰를 반환하거나 다른 방법으로 처리할 수 있습니다.
////    }
////
//    var body: some View {
//
//        VStack {
//            Button("Fetch Data") {
//                // 데이터 가져오기
//                moviemodel.fetch(cgid: "FE8EF4D2-F22D-4802-A39A-D58F23A29C1E", ssid: "", tokn: "", BrandCd: "indieart", CinemaCd: "000057", PlaySDT: "2023-07-01", non: "1688193005519") { theaters in
//                    if let theaters = theaters {
//                        // theaters를 출력 또는 사용
////                         print(theaters[0])
////                        print(type(of: theaters))
//                    } else {
//                        print("상영 정보를 가져오는데 실패했습니다.")
//                    }
//                }
//            }
//
//            // 상영 정보 표시
////            ForEach(moviemodel.showseqlist) { theaterVO in
////                Text(theaterVO.MovieTitle)
////            }
//        }
//    }
//}

struct MovieDetailView: View {
    @StateObject var moviemodel = TheaterManager()
    @State private var selectedShowseqlist: Showseqlist? = nil

    var body: some View {
        
        VStack {
            Button("Fetch Data") {
                // 데이터 가져오기
                moviemodel.fetch(cgid: "FE8EF4D2-F22D-4802-A39A-D58F23A29C1E", ssid: "", tokn: "", BrandCd: "indieart", CinemaCd: "000057", PlaySDT: "2023-07-02") { theaters in
                    if let theaters = theaters {
                        print(theaters)
                    } else {
                        print("상영 정보를 가져오는데 실패했습니다.")
                    }
                  
                }
            }
        }
    }
}



struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let moviemodel = TheaterManager()
        MovieDetailView(moviemodel: moviemodel)
    }
}
