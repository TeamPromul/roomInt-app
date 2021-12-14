//
//  Bubble.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

struct Bubble: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person")
                .resizable()
                .foregroundColor(Color.primaryColor)
                .background(Color.primaryColor)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10){
                Text("Amanda Doe")
                    .font(.system(size: 18, weight: .semibold))
                Text("amandagmail.com")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.gray)
                    
            }
        }
    }
}

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        Bubble()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
