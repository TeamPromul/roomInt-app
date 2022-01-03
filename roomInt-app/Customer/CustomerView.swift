//
//  CustomerView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 14/12/21.
//

import SwiftUI

struct CustomerView: View {
    @State private var navBarTitle = "Find Your Design"
    var body: some View {
        NavigationView {
                  TabView {
                      HomeTabItem(navBarTitle: $navBarTitle)
                          .tabItem {
                              Image(systemName: "house")
                              Text("Home")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: .automatic)
                      CatalogTabItem(navBarTitle: $navBarTitle)
                          .tabItem {
                              Image(systemName: "book")
                              Text("Catalog")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: .automatic)
                      ConsultTabItem(navBarTitle: $navBarTitle)
                          .tabItem {
                              Image(systemName: "ellipsis.bubble")
                              Text("Consult")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: .automatic)
                      ProfileTabItem(navBarTitle: $navBarTitle)
                          .tabItem {
                              Image(systemName: "person.circle")
                              Text("Profile")
                          }
                          .navigationBarTitle(navBarTitle, displayMode: .automatic)
                  }
              }
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
