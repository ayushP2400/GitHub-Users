//
//  WebView.swift
//  Github Users
//
//  Created by Ayush Pathak on 04/06/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(
        _ webView: WKWebView,
        context: Context
    ) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
