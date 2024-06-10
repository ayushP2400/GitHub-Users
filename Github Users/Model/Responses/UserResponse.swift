//
//  UserResponse.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Decodable,
                     Identifiable {
    let id: Int
    let userName: String

    let name: String?
    let followers, following: Int?

    private let avatarURLStr: String

    var avatarURL: URL? {
        URL(string: self.avatarURLStr)
    }

    enum CodingKeys: String, CodingKey {
        case userName = "login"
        case avatarURLStr = "avatar_url"
        case name
        case followers, following, id
    }
}
