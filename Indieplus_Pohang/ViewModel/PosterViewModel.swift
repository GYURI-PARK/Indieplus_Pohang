//
//  MovieTitlePicker.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/26.
//

import Foundation
import SwiftSoup

class PosterViewModel: ObservableObject {
    @Published var movieData: [[String: String]] = []
    @Published var movieCount = 0

    init() {
        fetchHTMLParsingResult()
    }
    
    func fetchHTMLParsingResult() {
        let urlAddress = "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057"
        guard let url = URL(string: urlAddress) else {
            return
        }
        
        DispatchQueue.global().async {
            do {
                let html = try String(contentsOf: url, encoding: .utf8)
                let doc: Document = try SwiftSoup.parse(html)
                
                let thumElements: Elements = try doc.select(".thum")
                
                var movieData: [[String: String]] = []
                
                for thumElement in thumElements {
                    guard let imgElement = try thumElement.select("img").first(),
                          let movieTitle = try thumElement.select(".subj").first()?.text() else {
                        continue
                    }
                    
                    let imgSource = try imgElement.attr("src")
                    let movieDict: [String: String] = ["imgSource": imgSource, "movieTitle": movieTitle]
                    movieData.append(movieDict)
                }
                
                DispatchQueue.main.async {
                    self.movieData = movieData
                    self.movieCount = movieData.count
                }
            } catch { }
        }
    }
}
