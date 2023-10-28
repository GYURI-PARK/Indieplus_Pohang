//
//  LoadingWebView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/08/16.
//

import SwiftUI
import Combine
import WebKit

struct LoadingWebView: UIViewRepresentable {
    var urlToLoad: String
    @ObservedObject var viewModel: LoadingWebViewModel
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlToLoad) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: DispatchQueue.main) // UI 업데이트는 메인 스레드에서 수행
            .sink(receiveCompletion: { _ in }) { data in
                uiView.load(data, mimeType: "text/html", characterEncodingName: "utf-8", baseURL: url)
            }
            .store(in: &viewModel.cancellables) // 뷰 모델의 cancellables에 저장
    }
}
