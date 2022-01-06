//
//  DesignerView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DesignerView: View {
    @State private var navBarTitle = "Find Your Design"
    @State var showNewView = false
    init() {
        let standardAppearance = UITabBarAppearance()
        UITabBar.appearance().backgroundColor = UIColor(Color.white)
        standardAppearance.backgroundColor = UIColor(Color.white)
        UITabBar.appearance().standardAppearance = standardAppearance
    }
    var body: some View {
        NavigationView {
            TabView {
                DashboardTabItem()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                ConsultDesignTabItem()
                    .tabItem {
                        Image(systemName: "ellipsis.bubble")
                        Text("Consult")
                    }
                
                ProfileDesignTabItem()
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
            }
            .navigationTitle("Designer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    NavigationLink(destination: UploadInteriorView(), isActive: $showNewView) {
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
