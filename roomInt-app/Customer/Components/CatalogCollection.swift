//
//  CatalogCollection.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

struct CatalogCollection: View {
    var body: some View {
        HStack(spacing: 15) {
            Image("HomeBg")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width/2.2, height: UIScreen.main.bounds.height/6)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Productivity")
                    .font(.system(size: 14, weight: .bold))
                Text("The design of a room can increase productivity")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(Color.primaryColor)
                
            }.padding(.trailing)
        }
        .background(Color.white)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func LivingRoomView() -> some View {
        
    }
}

struct CatalogCollection_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCollection()
            .padding()
    }
}
