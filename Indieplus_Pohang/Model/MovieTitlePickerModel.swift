//
//  MovieTitlePicker.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/26.
//

import Foundation
import SwiftSoup

class MovieTitlePickerModel {
    
    // MARK: 영화 제목 정보 가져오기
    func fetchHTMLParsingResult(completion: @escaping (Set<String>?, Error?) -> Void) {
        var uniqueTitles = Set<String>()
        let urlAddress = "https://culturalspace.phcf.or.kr/joongangArtHall/indiplusMovieSchedule.do"
        guard let url = URL(string: urlAddress) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            let movieTitles: Elements = try doc.select(".left").select("span") //.은 클래스
            
            for i in movieTitles {
                let title = try i.text()
                uniqueTitles.insert(title)
            }
            completion(uniqueTitles, nil)
        } catch let error {
            completion(nil, error)
        }
    }
    
    // MARK: 영화 제목만 뽑기
    func extractMovieTitle(from titles: Set<String>) -> [String] {
        let targetCharacter: Character = "["
        var extractedTitles: [String] = []
     
        for title in titles {
            if let index = title.firstIndex(of: targetCharacter) {
                let extractedString = String(title[..<index])
                extractedTitles.append(extractedString)
            }
        }
        return extractedTitles
    }
}
