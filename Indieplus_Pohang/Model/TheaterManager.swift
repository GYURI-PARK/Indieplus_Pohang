//
//  TheaterManager.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/30.
//

import Foundation
import SwiftUI

struct List: Codable {
    let Showseqlist: [Showseqlist]
}

struct Showseqlist: Codable {
    let PlaySDT: String
    let StartTime, EndTime: String
    let CinemaCd: String
    let MovieCd: String
    let RatingNm: String
    let PosterGuID: String
    let Url: String
    let MovieNm: String
    let RunningTime: String
    let MovieNmEng: String?
    let TotalSeatCnt, RemainSeatCnt: String
    let ShowSeq: String // 오늘 상영 순서
}

class TheaterManager: ObservableObject {
    let url = "https://dtryx.com/cinema/showseq_list.do"
    @Published var Showseqlist: [Showseqlist]
    
    init() {
        self.Showseqlist = []
    }
    
    func fetch(cgid: String, ssid: String?, tokn: String?, BrandCd: String, CinemaCd: String, PlaySDT: String, completion: @escaping ([TheaterVO]?) -> Void) {
        let param = "cgid&=\(cgid)&ssid=\(ssid)&tokn=\(tokn)&BrandCd=\(BrandCd)&CinemaCd=\(CinemaCd)&PlaySDT=\(PlaySDT)"
        guard let paramData = param.data(using: .utf8)else{
            NSLog("TheaterMegaManager paramData가 nil 입니다.")
            return
        }
        
        performRequest(with: url, paramData:paramData) { theaters in
                if let theaters = theaters {
                    // theaters를 출력 또는 사용
                    print(theaters)
                } else {
                    print("상영 정보를 가져오는데 실패했습니다.")
                }
                completion(theaters)
            }
    }
    
    func performRequest(with urlString: String, paramData:Data, completion: @escaping ([TheaterVO]?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = paramData
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            // 데이터 분석하기
            if let theaters = self.parseJSON(safeData) {
                completion(theaters)
            } else {
                completion(nil)
            }
            
        }
        task.resume()

    }
    
    func parseJSON(_ movieData: Data) ->[TheaterVO]? {
        do {
            let decoder = JSONDecoder() // decode: 데이터를 코드로 변경한다.
            let decodedData = try decoder.decode(List.self, from: movieData)
            let list = decodedData.Showseqlist
            let result = list.map{
                return TheaterVO(MovieDate: $0.PlaySDT,
                                 StartTime: $0.StartTime,
                                 EndTime: $0.EndTime,
                                 CinemaCd: $0.CinemaCd,
                                 MovieCd: $0.MovieCd,
                                 RatingNm: $0.RatingNm,
                                 PosterGuID: $0.PosterGuID,
                                 Url: $0.Url,
                                 MovieTitle: $0.MovieNm,
                                 RunningTime: $0.RunningTime,
                                 MovieNmEng: $0.MovieNmEng,
                                 TotalSeatCnt: $0.TotalSeatCnt,
                                 RemainSeatCnt: $0.RemainSeatCnt,
                                 ShowSeq: $0.ShowSeq)
            }
            self.Showseqlist = decodedData.Showseqlist
            return result
        } catch {
            print(error)
            assertionFailure("theaterMegaManger decoding fail")
            return nil
        }
    }
}
