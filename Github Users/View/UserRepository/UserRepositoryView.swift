//
//  UserRepositoryView.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import SwiftUI

struct UserRepositoryView: View {

    var user: UserResponse
    @ObservedObject private var userRepositoryViewModel = UserRepositoryViewModel()

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    UserListItemView(user: user)
                    Spacer()
                    Text(userRepositoryViewModel.currentUser?.name ?? "")
                        .bold()
                    Spacer()
                    HStack(alignment: .center) {
                        Image(systemName: "person.2.fill")
                        Text("**\(userRepositoryViewModel.currentUser?.followers ?? 0)** followers")
                        Image(systemName: "person.2")
                        Text("**\(userRepositoryViewModel.currentUser?.following ?? 0)** following")
                    }
                }.padding(
                    EdgeInsets(
                        top: 8,
                        leading: 0,
                        bottom: 8,
                        trailing: 0
                    )
                )
            }

            Section {
                // Filtering Non Forked Repositories
                ForEach((userRepositoryViewModel.repositories.filter({!$0.fork}))) { repository in
                    NavigationLink {
                        UserRepositoryDetailView(url: repository.url)
                    } label: {
                        UserRepositoryListItemView(repository: repository)
                    }
                }
            }
        }.task {
            await userRepositoryViewModel.fetchUserDetail(with: user.userName)
            await userRepositoryViewModel.fetchUserRepositories(with: user.userName)
        }.refreshable {
            await userRepositoryViewModel.fetchUserDetail(with: user.userName)
            await userRepositoryViewModel.fetchUserRepositories(with: user.userName)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
