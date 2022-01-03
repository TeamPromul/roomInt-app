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
                .frame(height: UIScreen.main.bounds.height/3.5, alignment: .center)
                .clipped()
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Rp. 500.000")
                        .font(.system(size: 15, weight: .medium))
                    Text("Living Room")
                        .font(.system(size: 10, weight: .regular))
                    Text("Light Room")
                        .font(.system(size: 10, weight: .regular))
                }
                Spacer()
                HStack {
                    Image(systemName: "ellipsis.bubble")
                        .foregroundColor(Color.secondaryColor)
                        .font(.system(size: 13, weight: .semibold))
                    Button {
                        
                    }label: {
                         Text("Talk to Us")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .semibold))
                    }
                    
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
                
            }
            
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
