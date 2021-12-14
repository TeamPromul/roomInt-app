//
//  SearchBar.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 30/11/21.
//

import SwiftUI

struct SearchBar: View {
    @State var searchText = ""
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .background(Color.white)
        .cornerRadius(13)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
