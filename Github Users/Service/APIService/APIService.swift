//
//  APIService.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import Foundation

protocol APIServiceDelegate {
    var session: URLSession { get }
    var baseUrl: String { get }

    func task<T: APIRequest>(
        request: T
    ) async throws -> T.resultType

}

class APIService: APIServiceDelegate {

    var session: URLSession
    var baseUrl: String

    init(
        session: URLSession = .shared,
        baseUrl: String = EnviourmentConstants.baseUrlPath
    ) {
        self.session = session
        self.baseUrl = baseUrl
    }

    func task<T: APIRequest>(
        request: T
    ) async throws -> T.resultType {
        let urlRequest = try request.buildHttpRequest(baseUrl: baseUrl)
        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ApiServiceError.invalidServerResponse
        }

        let decodedData = try JSONDecoder().decode(
            T.resultType.self,
            from: data
        )
        return decodedData
    }
}
