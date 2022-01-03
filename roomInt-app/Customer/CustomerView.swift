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
<<<<<<< HEAD

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
        .navigationBarBackButtonHidden(true)

=======
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
>>>>>>> f6e6999ec530eb9f84816ebd0810087761d30598
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
