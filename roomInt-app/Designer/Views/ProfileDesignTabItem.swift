//
//  ProfileDesignTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileDesignTabItem: View {
    @StateObject private var viewModel = UserViewModel()
    
    var profileItem = ["Edit Name", "Shipping Info", "Notification", "Terms & Condition"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                if let user = viewModel.user {
                    if let image = viewModel.user?.photo {
                        HStack {
                            WebImage(url: URL(string: image))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 10){
                                Text(user.name)
                                    .font(.system(size: 18, weight: .semibold))
                                Text(user.phoneNumber)
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }.padding()
                    } else {
                        HStack {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 10){
                                Text(user.name)
                                    .font(.system(size: 18, weight: .semibold))
                                Text(user.phoneNumber)
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }.padding()
                    }
                } else {
                    ProgressView()
                }
            
            ForEach(profileItem, id: \.self) { item in
                    HStack {
                        Text(item)
                            .font(.system(size: 15, weight: .regular))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 15, weight: .bold))
                    }.padding()
                }
            Button {
                viewModel.logout()
            }label: {
                Text("Logout")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.red)
            }
            .padding(.horizontal)
            Spacer()
        }.padding()
    }
}

struct ProfileDesignTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDesignTabItem()
    }
}
