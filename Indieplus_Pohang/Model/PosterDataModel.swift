//
//  MovieTitlePicker.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/26.
//

import Foundation
import SwiftSoup

class PosterDataModel {
    @Published var movieData: [[String: String]] = []
//    var movieData: [NSDictionary] = []
    
    func fetchHTMLParsingResult(completion: @escaping ([[String: String]]?, Error?) -> Void) {
        let urlAddress = "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057"
        guard let url = URL(string: urlAddress) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
            
            let thumElements: Elements = try doc.select(".thum")
            
            for thumElement in thumElements {
                guard let imgElement = try thumElement.select("img").first(),
                      let movieTitle = try thumElement.select(".subj").first()?.text() else {
                    continue
                }
                
                let imgSource = try imgElement.attr("src")
                let movieDict: [String: String] = ["imgSource": imgSource, "movieTitle": movieTitle]
//                let nsDictionary = movieDict as NSDictionary
                movieData.append(movieDict)
            }
            
            completion(movieData, nil)
        } catch let error {
            completion(nil, error)
        }
    }
}
