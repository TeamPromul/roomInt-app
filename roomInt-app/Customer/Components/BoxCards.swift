//
//  BoxCards.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 30/11/21.
//

import SwiftUI

struct BoxCards: View {
    var body: some View {
        ZStack {
            Image("HomeBg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/4.5)
                .scaledToFill()
            VStack(alignment: .leading) {
                Spacer()
                Text("Industrial")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width/2.5, alignment: .leading)
                    .background(Color.primaryColor)
            }
        }
        .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/4.5)
            .cornerRadius(16)
    }
}

struct BoxCards_Previews: PreviewProvider {
    static var previews: some View {
        BoxCards()
    }
}
