//
//  CatalogCards.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import SwiftUI

struct CatalogCards: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 13, weight: .medium))
                Text("Marrisa Fortuna")
                    .font(.system(size: 13, weight: .medium))
            }
            Image("HomeBg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3.5, alignment: .center)
                .clipped()
            Text("Rp. 500.000")
                .font(.system(size: 15, weight: .medium))
            Text("Living Room")
                .font(.system(size: 10, weight: .regular))
            Text("Light Room")
                .font(.system(size: 10, weight: .regular))
        }
    }
}

struct CatalogCards_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCards()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
