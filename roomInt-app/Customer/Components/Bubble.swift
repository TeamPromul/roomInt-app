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
                .background(Color.blue)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading){
                Text("Amanda Doe")
                    .font(.system(size: 18, weight: .semibold))
                
                    
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
