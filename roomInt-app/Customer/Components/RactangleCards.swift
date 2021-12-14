//
//  AllInformationCards.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 30/11/21.
//

import SwiftUI

struct RactangleCards: View {
    var body: some View {
        ZStack {
            Image("HomeBg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/3.5)
                .scaledToFill()
            VStack(alignment: .leading) {
                Text("Trending")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.secondaryColor)
                    .cornerRadius(10)
                    .padding(10)
                    
                Spacer()
                Text("Minimalis Room")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width/1.2, alignment: .leading)
                    .background(Color.primaryColor)
            }
        }
        .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/3.5)
            .cornerRadius(16)
            .padding()
    }
}

struct AllInformationCards_Previews: PreviewProvider {
    static var previews: some View {
        RactangleCards()
            .previewLayout(.sizeThatFits)
    }
}
