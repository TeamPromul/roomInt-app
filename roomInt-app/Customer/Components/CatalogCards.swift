//
//  CatalogCards.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatalogCards: View {
    let inter: Interior
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 13, weight: .medium))
                Text(inter.userName)
                    .font(.system(size: 13, weight: .medium))
            }
            if let image = inter.image {
                WebImage(url: URL(string: image))
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height/3.5, alignment: .center)
                    .clipped()
            }else {
                Image("Bed")
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height/3.5, alignment: .center)
                    .clipped()
            }
            
            Text(inter.title)
                .font(.system(size: 15, weight: .medium))
            Text(inter.category.rawValue)
                .font(.system(size: 10, weight: .regular))
            Text(inter.price)
                .font(.system(size: 10, weight: .regular))
            
        }
    }
}

//struct CatalogCards_Previews: PreviewProvider {
//    static var previews: some View {
//        CatalogCards(interiors: Interior()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
