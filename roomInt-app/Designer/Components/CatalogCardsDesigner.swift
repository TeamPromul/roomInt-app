//
//  CatalogCardsDesigner.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 03/01/22.
//

import SwiftUI

struct CatalogCardsDesigner: View {
    let inter: Interior
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
                .frame(height: UIScreen.main.bounds.height/3.5, alignment: .center)
                .clipped()
            
            Text(inter.title)
                .font(.system(size: 15, weight: .medium))
            Text(inter.category.rawValue)
                .font(.system(size: 10, weight: .regular))
            Text(inter.price)
                .font(.system(size: 10, weight: .regular))
        }
    }
}

struct CatalogCardsDesigner_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCardsDesigner(inter: Interior.preview)
    }
}
