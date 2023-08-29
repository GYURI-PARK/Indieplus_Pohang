//
//  MovieTitlePicker.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/26.
//

import Foundation
import SwiftSoup

//class PosterViewModel: ObservableObject {
//    @Published var movieData: [[String: String]] = []
//    @Published var movieCount = 0

// MARK: 1. DispatchQueue 사용
//    init() {
//        fetchHTMLParsingResult()
//    }
//
//    func fetchHTMLParsingResult() {
//        let urlAddress = "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057"
//        guard let url = URL(string: urlAddress) else {
//            return
//        }
//
//        DispatchQueue.global().async {
//            do {
//                let html = try String(contentsOf: url, encoding: .utf8)
//                let doc: Document = try SwiftSoup.parse(html)
//
//                let thumElements: Elements = try doc.select(".thum")
//
//                var movieData: [[String: String]] = []
//
//                for thumElement in thumElements {
//                    guard let imgElement = try thumElement.select("img").first(),
//                          let movieTitle = try thumElement.select(".subj").first()?.text() else {
//                        continue
//                    }
//
//                    let imgSource = try imgElement.attr("src")
//                    let movieDict: [String: String] = ["imgSource": imgSource, "movieTitle": movieTitle]
//                    movieData.append(movieDict)
//                }
//
//                DispatchQueue.main.async {
//                    self.movieData = movieData
//                    self.movieCount = movieData.count
//                }
//            }
//            catch {
//                print("error", error.localizedDescription)
//            }
//        }
//    }

    
    // MARK: 2. async / await 사용
//    func fetchHTMLPardsingResult() async {
//        let urlAddress = "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057"
//
//        guard let url = URL(string: urlAddress) else {
//            return
//        }
//
//        do {
//            let html = try String(contentsOf: url, encoding: .utf8)
//            let doc: Document = try SwiftSoup.parse(html)
//
//            let thumElements: Elements = try doc.select(".thum")
//
//            var movieData: [[String: String]] = []
//
//            for thumElement in thumElements {
//                guard let imgElement = try thumElement.select("img").first(),
//                      let movieTitle = try thumElement.select(".subj").first()?.text() else {
//                    continue
//                }
//
//                let imgSource = try imgElement.attr("src")
//                let movieDict: [String: String] = ["imgSource": imgSource, "movieTitle": movieTitle]
//                movieData.append(movieDict)
//            }
//
//            await setData(movieData: movieData)
//
//        } catch {
//            print("error", error.localizedDescription)
//        }
//    }
//
//    @MainActor
//    private func setData(movieData: [[String: String]]) {
//        self.movieData = movieData
//        self.movieCount = movieData.count
//    }
//
//
    // MARK: 3. URLSession 사용
//    func fetchHTMLParsingResult() {
//
//        // URL 생성
//        guard let url = URL(string: "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057") else {
//            return
//        }
//
//        // URLRequest 설정
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//
//        // URLSession 생성 (기본 세션)
//        let session = URLSession(configuration: .default)
//
//        // dataTask
//        let task = session.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let self = self else { return }
//
//            if let error = error {
//                print("Error:", error.localizedDescription)
//                return
//            }
//
//            if let response = response as? HTTPURLResponse {
//                print("Status code:", response.statusCode)
//
//                if (200..<300).contains(response.statusCode), let data = data {
//                    do {
//                        let html = String(data: data, encoding: .utf8)
//                        let doc: Document = try SwiftSoup.parse(html!)
//
//                        let thumElements: Elements = try doc.select(".thum")
//
//                        var movieData: [[String: String]] = []
//
//                        for thumElement in thumElements {
//                            guard let imgElement = try thumElement.select("img").first(),
//                                  let movieTitle = try thumElement.select(".subj").first()?.text() else {
//                                continue
//                            }
//
//                            let imgSource = try imgElement.attr("src")
//                            let movieDict: [String: String] = ["imgSource": imgSource, "movieTitle": movieTitle]
//                            movieData.append(movieDict)
//                        }
//
//                        DispatchQueue.main.async {
//                            self.movieData = movieData
//                            self.movieCount = movieData.count
//                        }
//                    } catch {
//                        print("Error parsing HTML:", error.localizedDescription)
//                    }
//                } else {
//                    print("Request failed with status code:", response.statusCode)
//                }
//            }
//        }
//        task.resume()
//    }
//}


// MARK: 4. Combine 사용
import Foundation
import SwiftSoup
import Combine

class PosterViewModel: ObservableObject {
    @Published var movieData: [[String: String]] = []
    @Published var movieCount = 0
    private var cancellables: Set<AnyCancellable> = []

    func fetchHTMLParsingResult() {
        guard let url = URL(string: "https://www.dtryx.com/cinema/main.do?cgid=FE8EF4D2-F22D-4802-A39A-D58F23A29C1E&BrandCd=indieart&CinemaCd=000057") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { data -> String? in
                String(data: data, encoding: .utf8)
            }
            .tryMap { html -> [[String: String]] in
                let doc = try SwiftSoup.parse(html)
                let thumElements = try doc.select(".thum")

                var movieData: [[String: String]] = []

                for thumElement in thumElements {
                    if let imgElement = try? thumElement.select("img").first(),
                       let movieTitle = try? thumElement.select(".subj").first()?.text() {

                        let imgSource = try? imgElement.attr("src")
                        let movieDict: [String: String] = ["imgSource": imgSource ?? "", "movieTitle": movieTitle]
                        movieData.append(movieDict)
                    }
                }

                return movieData
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {
                    completion in
                if case .failure(let error) = completion {
                    print("Error:", error.localizedDescription)
                }
            },
                receiveValue: { [weak self] movieData in
                self?.movieData = movieData
                self?.movieCount = movieData.count
            })
            .store(in: &cancellables)
    }
}
