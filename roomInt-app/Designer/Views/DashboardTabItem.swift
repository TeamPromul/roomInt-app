//
//  DashboardTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DashboardTabItem: View {
    @State private var mode: Int = 0
    @State var category: Category = .all
    var body: some View {
        ScrollView(showsIndicators: false) {
            SearchBar()
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Category.allCases, id: \.id) { item in
                        CategoryStack(cats: item, isSelected: self.category == item, onSelect: { selectedValue in
                            self.category = selectedValue
                        })
                            .padding(.horizontal, 10)
                            .padding(.top, 5)
                    }
                }
            }.padding()
    
            ForEach(0..<8) {_ in
                CatalogCardsDesigner()
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        }
    }
}

struct DashboardTabItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabItem()
    }
}
