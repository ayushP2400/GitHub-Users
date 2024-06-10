//
//  UserDetailAPIRequest.swift
//  Github Users
//
//  Created by Ayush Pathak on 04/06/24.
//

import Foundation

struct UserDetailAPIRequest: APIRequest {
    typealias resultType = UserResponse

    var userName: String

    var path: String {
        return "/users/" + userName
    }

    var headers: [String : String] = [
        "accept": "application/vnd.github+json",
        "Authorization": "Bearer " + EnviourmentConstants.authToken
    ]

    var method: HttpMethod = .get

    var queryItems: [URLQueryItem]? = nil
    
    func body() throws -> Data? {
        return nil
    }
}
