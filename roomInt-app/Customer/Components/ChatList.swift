//
//  ChatList.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 27/12/21.
//

import SwiftUI

struct ChatList: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(Color.gray)
                .font(.system(size: 60))
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Amanda Doe")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(Color.black)
                    Spacer()
                    Text("18.23")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.black)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.black)
                }
                Text("Pembayaran anda belum berhasil. Silahkan mencoba beberapa saat lagi.")
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 15, weight: .regular))
                    .lineLimit(2)
                Divider()
                    .padding(.top, 5)
            }
            
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
        //.previewLayout(.sizeThatFits)
            .padding()
    }
}
