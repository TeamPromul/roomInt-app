//
//  ContentView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var navBarHidden = false
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem(navBarHidden: $navBarHidden)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .navigationBarTitle(Text("Find Your Design"), displayMode: .inline)
                    .navigationBarHidden(navBarHidden)
                CatalogTabItem(navBarHidden: $navBarHidden)
                    .tabItem {
                        Image(systemName: "book")
                        Text("Catalog")
                    }
                    .navigationBarTitle(Text("Find Your Design"), displayMode: .inline)
                    .navigationBarHidden(navBarHidden)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
