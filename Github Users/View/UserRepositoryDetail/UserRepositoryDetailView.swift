//
//  UserRepositoryDetailView.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import SwiftUI
import WebKit

struct UserRepositoryDetailView: View {

    let url: String

    var body: some View {
        if let url = URL(string: url) {
            WebView(url: url)
        } else {
            Text("Invalid Url")
        }
    }
}

#Preview {
    UserRepositoryDetailView(url: "https://www.google.com")
}
