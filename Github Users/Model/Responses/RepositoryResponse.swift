//
//  RepositoryResponse.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import Foundation

struct RepositoryResponse: Decodable,
                           Identifiable {
    let name: String
    let programmingLanguage: String?
    let stargazersCount: Int
    let fork: Bool
    let url: String
    let description: String?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case programmingLanguage = "language"
        case stargazersCount = "stargazers_count"
        case name, fork, description, id
        case url = "html_url"
    }
}
