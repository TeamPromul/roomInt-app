//
//  ProfileDesignTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct ProfileDesignTabItem: View {
    var profileItem = ["Edit Name", "Shipping Info", "Notification", "Terms & Condition"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Bubble()
                .padding(.horizontal)
            ForEach(profileItem, id: \.self) { item in
                    HStack {
                        Text(item)
                            .font(.system(size: 15, weight: .regular))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.system(size: 15, weight: .bold))
                    }.padding()
                }
            Button {
                
            }label: {
                Text("Logout")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.red)
            }
            .padding(.horizontal)
            Spacer()
        }.padding()
    }
}

struct ProfileDesignTabItem_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDesignTabItem()
    }
}
