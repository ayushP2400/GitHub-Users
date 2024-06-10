//
//  UserListAPIRequest.swift
//  Github Users
//
//  Created by Ayush Pathak on 04/06/24.
//

import Foundation

struct UserListAPIRequest: APIRequest {
    typealias resultType = [UserResponse]

    var path: String { "/users" }

    var headers: [String: String] = [
        "accept": "application/vnd.github+json",
        "Authorization": "Bearer " + EnviourmentConstants.authToken
    ]

    var method: HttpMethod = .get

    var queryItems: [URLQueryItem]? = nil

    func body() throws -> Data? {
        return nil
    }
}
