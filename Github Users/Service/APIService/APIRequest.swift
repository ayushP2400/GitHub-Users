//
//  APIRequest.swift
//  Github Users
//
//  Created by Ayush Pathak on 04/06/24.
//

import Foundation

protocol APIRequest {
    associatedtype resultType: Decodable

    var path: String { get }
    var headers: [String: String] { get }
    var method: HttpMethod { get }
    var queryItems: [URLQueryItem]? { get }

    func body() throws -> Data?
}

extension APIRequest {
    func buildHttpRequest(baseUrl: String) throws -> URLRequest {
        guard var url = URL(string: baseUrl + path) else {
            throw ApiServiceError.invalidRequestURL
        }

        if let queryItems = queryItems,
           var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true
           ) {
            components.queryItems = queryItems
            if let componentUrl = components.url {
                url = componentUrl
            }
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = try body()

        return urlRequest
    }
}

public enum HttpMethod: String {
    case get
    case post
    case put
    case delete
}

public enum ApiServiceError: Error {
    case invalidRequestURL
    case invalidServerResponse
}
