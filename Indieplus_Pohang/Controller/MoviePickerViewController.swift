//
//  MoviePickerViewController.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import Foundation
import SwiftSoup
import UIKit

class MoviePickerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchHTMLParsingResultWill()
    }

    func fetchHTMLParsingResultWill() {
        
        // MARK: 영화 제목 정보 가져오기
        let urlAddress = "https://culturalspace.phcf.or.kr/joongangArtHall/indiplusMovieSchedule.do"
        guard let url = URL(string: urlAddress) else { return }
        do {
            let html = try String(contentsOf: url, encoding: .utf8)
            let doc: Document = try SwiftSoup.parse(html)
              
            let movieTitles: Elements = try doc.select(".left").select("span") //.은 클래스
            for i in movieTitles {
                print("title: ", try i.text())
            }
            
        } catch let error {
            print("Error : \(error)")
        }
    }
}

