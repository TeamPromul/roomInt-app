//
//  ProfileTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

struct ProfileTabItem: View {
    var profileItem = ["Edit Name", "Shipping Info", "Notification", "Terms & Condition"]
    @Binding var navBarTitle: String
    @Binding var displayMode: NavigationBarItem.TitleDisplayMode
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Bubble()
                .padding(.horizontal)
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
            self.displayMode = .large
        }
    }
}

struct ProfileTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabItem(navBarTitle: .constant("Profile"), displayMode: .constant(.large))
    }
}
