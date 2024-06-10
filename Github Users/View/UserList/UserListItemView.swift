//
//  UserListItemView.swift
//  Github Users
//
//  Created by Ayush Pathak on 03/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserListItemView: View {

    var user: UserResponse

    var body: some View {
        HStack {
            WebImage(url: user.avatarURL) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.circle.fill")
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: 60, height: 60, alignment: .leading)

            Text(user.userName)
                .font(.system(size: 18))
            
            Spacer()
        }
    }
}
