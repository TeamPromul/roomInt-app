//
//  DesignerView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DesignerView: View {
    @State private var navBarTitle = "Find Your Design"
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
              }
    }
}

struct DesignerView_Previews: PreviewProvider {
    static var previews: some View {
        DesignerView()
    }
}
