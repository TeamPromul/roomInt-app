//
//  ConsultTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 14/12/21.
//

import SwiftUI

struct ConsultTabItem: View {
    @Binding var navBarTitle: String
    @Binding var displayMode: NavigationBarItem.TitleDisplayMode
    var body: some View {
        ScrollView(.vertical) {
            ForEach(0..<5) { _ in
                NavigationLink(destination: ConsultView()) {
                        ChatList()
    
                }
            }
        }
        .padding()
        .onAppear {
                self.navBarTitle = "Consult"
                self.displayMode = .large
            }
    }
}

struct ConsultTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ConsultTabItem(navBarTitle: .constant("Consult"), displayMode: .constant(.large))
    }
}
