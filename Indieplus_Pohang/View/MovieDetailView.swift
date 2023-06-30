//
//  MovieDetailView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/30.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var moviemodel: TheaterManager
    @State private var selectedShowseqlist: Showseqlist? = nil
    
    private func makeMovieForm() -> some View {
        if let firstShowseqlist = moviemodel.showseqlist.first {
            selectedShowseqlist = Showseqlist(
                PlaySDT: firstShowseqlist.PlaySDT,
                StartTime: firstShowseqlist.StartTime,
                EndTime: firstShowseqlist.EndTime,
                CinemaCd: firstShowseqlist.CinemaCd,
                MovieCd: firstShowseqlist.MovieCd,
                RatingNm: firstShowseqlist.RatingNm,
                PosterGuID: firstShowseqlist.PosterGuID,
                Url: firstShowseqlist.Url,
                MovieNm: firstShowseqlist.MovieNm,
                RunningTime: firstShowseqlist.RunningTime,
                MovieNmEng: firstShowseqlist.MovieNmEng,
                TotalSeatCnt: firstShowseqlist.TotalSeatCnt,
                RemainSeatCnt: firstShowseqlist.RemainSeatCnt,
                ShowSeq: firstShowseqlist.ShowSeq
            )
        }
        return EmptyView() // 실제로 반환할 값이 없는 경우, 적절한 뷰를 반환하거나 다른 방법으로 처리할 수 있습니다.
    }
    
    var body: some View {
        VStack {
            makeMovieForm()
            if let showseqlist = selectedShowseqlist {
                Text("Movie Title: \(showseqlist.MovieCd)")
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
