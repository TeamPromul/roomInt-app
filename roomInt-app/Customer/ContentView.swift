//
//  ContentView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeTabItem()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .navigationBarTitle(Text("Find Your Design"), displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
