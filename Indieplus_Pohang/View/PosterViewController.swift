//
//  MoviePickerViewController.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import Foundation
import SwiftSoup

// 모델에서 데이터를 관리하고 ViewController에서는 모델을 사용하여 데이터를 가져오는 방식으로 코드가 구성되었습니다. 이렇게 하면 데이터 관리와 UI 업데이트를 분리하여 코드를 더 구조적이고 유지보수하기 쉽게 만들 수 있습니다.

class PosterViewController: UIViewController {
    var model = PosterDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHTMLParsingResult()
    }
    
    func fetchHTMLParsingResult() {
        model.fetchHTMLParsingResult { [weak self] (movieData, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let movieData = movieData {
                print(movieData)
            }
        }
    }
}
