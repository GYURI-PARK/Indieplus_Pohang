//
//  MoviePickerViewController.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import Foundation
import SwiftSoup

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
