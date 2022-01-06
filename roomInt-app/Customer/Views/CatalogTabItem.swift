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
    @StateObject private var viewModel = ViewModel()
    @State var search = ""
    var body: some View {
        VStack {
            SearchBarComponent(text: $search)
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { item in
                        CategoryStack(cats: item, isSelected: self.viewModel.category == item, onSelect: { selectedValue in
                            self.viewModel.category = selectedValue
                        })
                            .padding(.horizontal, 10)
                            .padding(.top, 5)
                    }
                }
            }.padding(.horizontal)
            Divider()
                .padding(.vertical, 10)
            
            ScrollView(showsIndicators: false) {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    viewModel.fetchAllUser()
                }
                ForEach(viewModel.filteredInteriors.reversed().filter({search.isEmpty ? true : $0.title.contains(search)}), id: \.self) {item in
                    CatalogCards(inter: item)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
            }
        }
        .onAppear {
            viewModel.fetchAllUser()
            self.navBarTitle = "Catalog"
        }
    }
}

struct CatalogTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CatalogTabItem(navBarTitle: .constant(""))
    }
}
