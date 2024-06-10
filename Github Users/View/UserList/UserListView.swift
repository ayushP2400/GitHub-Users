//
//  UserListView.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import SwiftUI

struct UserListView: View {

    @ObservedObject private var userListViewModel = UserListViewModel()

    var body: some View {
        NavigationStack {
            List(userListViewModel.users) { user in
                NavigationLink {
                    UserRepositoryView(user: user)
                } label: {
                    UserListItemView(user: user)
                }
            }
            .navigationTitle("Users")
            .refreshable {
                await userListViewModel.fetchUsers()
            }
            .task {
                await userListViewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UserListView()
}
