//
//  ProfileTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

struct ProfileTabItem: View {

    @ObservedObject private var viewModel = UserViewModel()

    var profileItem = ["Edit Name", "Shipping Info", "Notification", "Terms & Condition"]
    @Binding var navBarTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: viewModel.userData.photo!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }

                VStack(alignment: .leading, spacing: 10){
                    Text(viewModel.userData.name)
                        .font(.system(size: 18, weight: .semibold))
                    Text(viewModel.userData.email)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.gray)

                }
            } else {
                // Fallback on earlier versions
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
//                viewModel.logout()
                print(viewModel.userData)
            }label: {
                Text("Logout")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.red)
            }
            .padding(.horizontal)
            Spacer()
        }.padding()
        
        .onAppear {
            self.navBarTitle = "Profile"
        }
    }
}

struct ProfileTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabItem(navBarTitle: .constant("Profile"))
    }
}
