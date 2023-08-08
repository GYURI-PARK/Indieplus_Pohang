//
//  MovieManager.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/07/05.
//

import Foundation

class MoviePickerViewModel: ObservableObject {
    
    @Published var movieTitles: [String] = [] // 영화 제목들을 저장할 배열
    @Published var movieTimes: [String] = [] // 영화 시간들을 저장할 배열
    @Published var movieEngTitles: [String] = [] // 영어제목들을 저장할 배열
    @Published var count: Int = 0
    private let theatermodel = TheaterManager()
    
    func getMovieDetail(date: String) {
        DispatchQueue.main.async {
            self.theatermodel.fetch(cgid: "FE8EF4D2-F22D-4802-A39A-D58F23A29C1E", ssid: "", tokn: "", BrandCd: "indieart", CinemaCd: "000057", PlaySDT: date) { theaters in
                DispatchQueue.main.async {
                    do {
                        guard let theaters = theaters else {
                            print("상영 정보를 가져오는데 실패했습니다.")
                            return
                        }
                        
                        let sortedTheaters = try theaters.sorted { (theater1, theater2) throws -> Bool in
                            guard let showSeq1 = Int(theater1.ShowSeq), let showSeq2 = Int(theater2.ShowSeq) else {
                                throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "ShowSeq parsing failed."])
                            }
                            return showSeq1 < showSeq2
                        }
                        
                        self.movieTitles = sortedTheaters.map { $0.MovieTitle }
                        self.movieTimes = sortedTheaters.map { $0.StartTime }
                        self.movieEngTitles = sortedTheaters.map { $0.MovieNmEng ?? "" }
                        self.updateCount()
                        print("정렬된 리스트", self.movieTitles)
                        print("개수", self.movieTitles.count)
                        print("영어", self.movieEngTitles)
                    } catch {
                        print("정렬에 실패했습니다: \(error.localizedDescription)")
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
    
    func updateMovieTitles(newTitles: [String]) {
        DispatchQueue.main.async {
            self.movieTitles = newTitles
        }
    }
}
