//
//  CatalogTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/12/21.
//

import SwiftUI

struct CatalogTabItem: View {
    @State private var mode: Int = 0
    @Binding var navBarHidden: Bool
    @Binding var navBarTitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Category", selection: $mode) {
                Text("Living Room").tag(0)
                Text("Bedroom").tag(1)
                Text("Kitchen").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.top)
            if mode == 0 {
                livingRoomView()
            }else if mode == 1 {
                bedroomView()
            }else {
                KitchenView()
            }
        }
        .onAppear {
            self.navBarHidden = true
        }.onDisappear {
            self.navBarHidden = false
        }
    }
    
    @ViewBuilder
    private func livingRoomView() -> some View {
        VStack(spacing: 20) {
            SearchBar()
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            CatalogCollection()
                .padding(.horizontal)
            Spacer()
        }
        .background(AppColor.grayBg)
    }
    
    @ViewBuilder
    private func bedroomView() -> some View {
        VStack(spacing: 20) {
            SearchBar()
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            CatalogCollection()
                .padding(.horizontal)
            Spacer()
        }
        .background(AppColor.grayBg)
    }
    
    @ViewBuilder
    private func KitchenView() -> some View {
        VStack(spacing: 20) {
            SearchBar()
                .padding(.horizontal)
                .padding(.top)
                .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            CatalogCollection()
                .padding(.horizontal)
            Spacer()
        }
        .background(AppColor.grayBg)
    }
}

struct CatalogTabItem_Previews: PreviewProvider {
    static var previews: some View {
        CatalogTabItem(navBarHidden: .constant(true), navBarTitle: .constant(""))
    }
}
