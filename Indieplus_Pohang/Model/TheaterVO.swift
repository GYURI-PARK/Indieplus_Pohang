//
//  TheaterVO.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/30.
//

import Foundation

struct TheaterVO: Codable {
    let MovieDate: String
    let StartTime, EndTime: String
    let CinemaCd: String
    let MovieCd: String
    let RatingNm: String
    let PosterGuID: String
    let Url: String
    let MovieTitle: String
    let RunningTime: String
    let MovieNmEng: String?
    let TotalSeatCnt, RemainSeatCnt: String
    let ShowSeq: String // 오늘 상영 순서
    
//    var theaterFullName: String = "" //로컬에서 가져온 상영관 이름
//    var distance:Double?
//    var theaterDetail:[String:String]?
//    var score:Double?
}


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
