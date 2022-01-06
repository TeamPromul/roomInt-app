//
//  CatalogTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/12/21.
//

import SwiftUI

struct CatalogTabItem: View {
    @State private var mode: Int = 0
    @Binding var navBarTitle: String
    @State var category: Category = .all
    @ObservedObject private var repository: InteriorViewModel = .shared
    var body: some View {
        ScrollView(showsIndicators: false) {
            
//            SearchBar()
//                .padding(.horizontal)
//                .padding(.top)
//                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { item in
                        CategoryStack(cats: item, isSelected: self.category == item, onSelect: { selectedValue in
                            self.category = selectedValue
                        })
                            .padding(.horizontal, 10)
                            .padding(.top, 5)
                    }
                }
            }.padding()
            
            ForEach(repository.listInterior, id: \.id) {item in
                CatalogCards(interiors: item)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        }
        .onAppear {
            self.navBarTitle = "Catalog"
        }
    }
}

struct CatalogTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CatalogTabItem(navBarTitle: .constant(""))
    }
}
