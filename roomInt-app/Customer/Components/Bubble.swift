//
//  Bubble.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 13/12/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct Bubble: View {
    var photo: String
    var name: String
    var email: String

    var body: some View {
        HStack(spacing: 15) {

            AsyncImage(url: URL(string: photo)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading, spacing: 10){
                Text(name)
                    .font(.system(size: 18, weight: .semibold))
                Text(email)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.gray)

            }
        }
    }
}

@available(iOS 15.0, *)
struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        Bubble(photo: "https://firebasestorage.googleapis.com:443/v0/b/roomint-226ee.appspot.com/o/kpilAJhY79PJvu1ooSmeN5wMyeX2?alt=media&token=0146f2f3-03cc-4834-aa0b-38b14aceef23",
               name: "Amanda Doe",
               email: "ini@email.com")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
