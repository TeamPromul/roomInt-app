//
//  CustomerView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 14/12/21.
//

import SwiftUI

struct CustomerView: View {
    @State private var navBarHidden = false
    @State private var navBarTitle = "Find Your Design"
    @State private var displayMode: NavigationBarItem.TitleDisplayMode = .large
    var body: some View {
        NavigationView {
                  TabView {
                      HomeTabItem(navBarHidden: $navBarHidden, navBarTitle: $navBarTitle, displayMode: $displayMode)
                          .tabItem {
                              Image(systemName: "house")
                              Text("Home")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: displayMode)
                          .navigationBarHidden(navBarHidden)
                      CatalogTabItem(navBarHidden: $navBarHidden, navBarTitle: $navBarTitle)
                          .tabItem {
                              Image(systemName: "book")
                              Text("Catalog")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: displayMode)
                          .navigationBarHidden(navBarHidden)
                      ConsultTabItem(navBarTitle: $navBarTitle, displayMode: $displayMode)
                          .tabItem {
                              Image(systemName: "ellipsis.bubble")
                              Text("Consult")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: displayMode)
                      ProfileTabItem(navBarTitle: $navBarTitle, displayMode: $displayMode)
                          .tabItem {
                              Image(systemName: "person.circle")
                              Text("Profile")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: displayMode)
                  }
              }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
