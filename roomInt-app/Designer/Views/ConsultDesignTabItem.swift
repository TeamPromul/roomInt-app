//
//  ConsultDesignTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct ConsultDesignTabItem: View {
    @Binding var navBarTitle: String
    var body: some View {
        Text("Coming Soon")
            .onAppear {
                self.navBarTitle = "Consult"
            }
    }
}

struct ConsultDesignTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ConsultDesignTabItem(navBarTitle: .constant("Consult"))
    }
}
