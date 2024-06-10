//
//  UserRepositoryListItemView.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import SwiftUI

struct UserRepositoryListItemView: View {

    var repository: RepositoryResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(repository.name)
                .font(.system(size: 17, weight: .semibold))

            Text(repository.description ?? "")

            HStack(spacing: 8) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text("\(repository.stargazersCount)")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)

                Text(repository.programmingLanguage ?? "")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
            }
        }
    }
}
