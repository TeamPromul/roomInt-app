//
//  DesignerView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DesignerView: View {
    @State var showNewView = false
    @State private var navBarTitle = "Home"
    init() {
        let standardAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = UIColor(Color.serachBarBg)
        standardAppearance.backgroundColor = UIColor(Color.serachBarBg)
        UITabBar.appearance().standardAppearance = standardAppearance
    }
    var body: some View {
        NavigationView {
            TabView {
                DashboardTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .navigationBarTitle(navBarTitle, displayMode: .inline)
                ConsultDesignTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "ellipsis.bubble")
                        Text("Consult")
                    }
                    .navigationBarTitle(navBarTitle, displayMode: .inline)
                ProfileDesignTabItem(navBarTitle: $navBarTitle)
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                    .navigationBarTitle(navBarTitle, displayMode: .inline)
            }
            .navigationBarItems(trailing: NavigationLink(destination: UploadInteriorView(), isActive: $showNewView) {
                Button {
                    self.showNewView = true
                }label: {
                    Image(systemName: "plus.app.fill")
                        .font(.system(size: 25))
                }
                
            })
        }
    }
}

struct DesignerView_Previews: PreviewProvider {
    static var previews: some View {
        DesignerView()
    }
}
