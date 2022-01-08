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
    @Binding var navBarTitle: String
    
    var body: some View {
        if let user = viewModel.user {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading) {
                    HStack (spacing: 15) {
                        if let image = viewModel.user?.photo {
                            WebImage(url: URL(string: image))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 72, height: 72)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person")
                                .font(.system(size: 72))
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading, spacing: 10){
                            Text(user.name)
                                .font(.system(size: 18, weight: .semibold))
                            if user.email != "" {
                                Text(user.email)
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.gray)
                            } else {
                                Text("Your email")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.gray)
                            }
                        }
                    }.padding()
                    
                    HStack {
                        Text("Email")
                            .font(.system(size: 12, weight: .semibold))
                        Spacer()
                        Text(user.email)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .bold))
                    }.padding()
                    
                    HStack {
                        Text("Phone Number")
                            .font(.system(size: 12, weight: .semibold))
                        Spacer()
                        Text(user.phoneNumber)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .bold))
                    }.padding()
                    
                }
                Spacer()
                Button {
                    viewModel.logout()
                }label: {
                    Text("Logout")
                        .padding()
                        .padding(.horizontal)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(26)
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.grayBg2)
            .onAppear {
                self.navBarTitle = "Profile"
            }
        }else {
            ProgressView()
                .onAppear {
                    self.navBarTitle = "Profile"
                }
        }
    }
    
}

struct ProfileDesignTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDesignTabItem(navBarTitle: .constant("Profile"))
    }
}
