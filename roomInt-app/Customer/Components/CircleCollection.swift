//
//  CircleCollection.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 30/11/21.
//

import SwiftUI

struct CircleCollection: View {
    var body: some View {
        VStack{
            Image("HomeBg")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            Text("hello")
                .font(.system(size: 10))
        }
    }
}

struct CircleCollection_Previews: PreviewProvider {
    static var previews: some View {
        CircleCollection()
            .previewLayout(.sizeThatFits)
    }
}
