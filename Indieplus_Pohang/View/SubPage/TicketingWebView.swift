//
//  TicketingWebView.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/08/16.
//

import SwiftUI
import WebKit

struct TicketingWebView: UIViewRepresentable {
    
    var urlToLoad: String
    @ObservedObject var viewModel: TicketingWebViewModel
    
    
    // 뷰 객체를 생성하고 초기 상태를 구성합니다. 딱 한 번만 호출됩니다.
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        // WebView 로드
        webView.load(URLRequest(url: url))
        return webView
    }
    
    // update UIView
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<TicketingWebView>) {
        
    }
    
    // 탐색 변경을 수락 또는 거부하고 탐색 요청의 진행 상황을 추적
//    class Coordinator : NSObject, WKNavigationDelegate {
//        
//    }
}
