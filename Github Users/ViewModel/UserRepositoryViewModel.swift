//
//  UserRepositoryViewModel.swift
//  Github Users
//
//  Created by Ayush Pathak on 04/06/24.
//

import Foundation

protocol UserRepositoryViewDataSource: AnyObject {
    var currentUser: UserResponse? { get set }
    func fetchUserDetail(with userName: String) async

    var repositories: [RepositoryResponse] { get set }
    func fetchUserRepositories(with userName: String) async
}

class UserRepositoryViewModel: UserRepositoryViewDataSource,
                               ObservableObject {
    
    @Published var currentUser: UserResponse?
    @Published var repositories: [RepositoryResponse] = []

    func fetchUserDetail(with userName: String) async {

        let request = UserDetailAPIRequest(userName: userName)

        do {
            let user = try await APIService().task(request: request)
            DispatchQueue.main.async {
                self.currentUser = user
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    func fetchUserRepositories(with userName: String) async {

        let request = UserRepositoryAPIRequest(userName: userName)
        do {
            let repositories = try await APIService().task(request: request)
            DispatchQueue.main.async {
                self.repositories = repositories
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
