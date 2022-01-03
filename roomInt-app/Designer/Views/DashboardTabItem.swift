//
//  DashboardTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DashboardTabItem: View {
    var body: some View {
        NavigationLink(destination: UploadInteriorView()) {
            Text("Upload Design Interior")
        }
    }
}

struct DashboardTabItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabItem()
    }
}
