//
//  ChatBubble.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 27/12/21.
//

import SwiftUI

struct ChatBubble: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(Color.gray)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10){
                Text("name")
                    .font(.system(size: 18, weight: .semibold))
                Text("content")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.gray)
                    
            }
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble()
    }
}
