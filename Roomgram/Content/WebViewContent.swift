//
//  WebViewContent.swift
//  Roomgram
//
//  Created by СОВА on 11.10.2021.
//

import Foundation
import SwiftUI
import WebKit


struct WebViewContent: UIViewRepresentable {

    let url: String?
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        guard let url = URL(string: self.url!) else {return WKWebView()}
        let recvest = URLRequest(url: url)
        webView.load(recvest)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let urlValue = self.url  {
                    if let requestUrl = URL(string: urlValue) {
                        uiView.load(URLRequest(url: requestUrl))
                    }
                }
    }
    
}


