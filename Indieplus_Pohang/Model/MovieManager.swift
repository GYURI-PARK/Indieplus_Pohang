//
//  MovieManager.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/07/05.
//

import Foundation

class MovieManager: ObservableObject {
    @Published var movieTitles: [String] = [] // 영화 제목들을 저장할 배열
    @Published var count: Int = 0
    private let theatermodel = TheaterManager()
//    @Published var isLoading: Bool = false
    
    // showSeq 기준으로 정렬 후 selectedDate에 해당하는 영화 제목 뽑아오기
//    init() {
//            let today = Date()
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            let dateString = dateFormatter.string(from: today)
//            getMovieDetail(date: dateString)
//        }

    func getMovieDetail(date: String) {
        DispatchQueue.main.async {
            self.theatermodel.fetch(cgid: "FE8EF4D2-F22D-4802-A39A-D58F23A29C1E", ssid: "", tokn: "", BrandCd: "indieart", CinemaCd: "000057", PlaySDT: date) { theaters in
                DispatchQueue.main.async {
                    if let theaters = theaters {
                        let sortedTheaters = theaters.sorted { Int($0.ShowSeq) ?? 0 < Int($1.ShowSeq) ?? 0 }
                        self.movieTitles = sortedTheaters.map { $0.MovieTitle } // 영화 제목들을 업데이트
                        self.updateCount()
                        print("정렬된 리스트", self.movieTitles)
                        print("개수", self.movieTitles.count)
                    } else {
                        print("상영 정보를 가져오는데 실패했습니다.")
                    }
                }
            }
        }
    }
    
    func updateCount() {
        DispatchQueue.main.async {
            self.count = self.movieTitles.count
        }
    }
}
