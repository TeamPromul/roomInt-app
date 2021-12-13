//
//  ProfileTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

struct ProfileTabItem: View {
    @Binding var navBarTitle: String
    @Binding var displayMode: NavigationBarItem.TitleDisplayMode
    var body: some View {
        VStack {
            Bubble()
            Spacer()
        }.onAppear {
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
