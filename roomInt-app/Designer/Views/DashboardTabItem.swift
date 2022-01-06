//
//  DashboardTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 01/01/22.
//

import SwiftUI

struct DashboardTabItem: View {
    @State private var mode: Int = 0
    @StateObject private var viewModel = ViewModel()
    @State var category: Category = .all
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
                        CategoryStack(cats: item, isSelected: viewModel.category == item, onSelect: { selectedValue in
                            viewModel.category = selectedValue
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
                    viewModel.fetchInter()
                    viewModel.filterInter()
                }
                
                ForEach(viewModel.filteredInteriors.reversed().filter({search.isEmpty ? true : $0.title.contains(search)}), id: \.self) {item in
                    CatalogCardsDesigner(inter: item)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
                
            }
        }.onAppear() {
            SessionService.shared.setup()
            viewModel.fetchInter()
            viewModel.filterInter()
        }.coordinateSpace(name: "pullToRefresh")
    }
}

struct DashboardTabItem_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabItem()
    }
}


struct PullToRefresh: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                }
                Spacer()
            }
        }.padding(.top, -100)
    }
}
