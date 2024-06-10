//
//  UserListViewModel.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import Foundation

protocol UserListViewDataSource: AnyObject {
    var users: [UserResponse] { get set }
    func fetchUsers() async
}

class UserListViewModel: UserListViewDataSource,
                         ObservableObject {

    @Published var users: [UserResponse] = []

    func fetchUsers() async {

        let request = UserListAPIRequest()

        do {
            let users = try await APIService().task(request: request)
            DispatchQueue.main.async {
                self.users = users
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
