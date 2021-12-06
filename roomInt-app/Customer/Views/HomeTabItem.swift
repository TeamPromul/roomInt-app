//
//  HomeTabItem.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 30/11/21.
//

import SwiftUI

struct HomeTabItem: View {
    let columnsForCircle = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let columnsForBox = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.vertical){
            ZStack (alignment: .top) {
                Image("HomeBg")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                    .scaledToFill()
                SearchBar()
                    .shadow(color: .black.opacity(0.2), radius: 5, x: -4, y: 3)
            }
            VStack(alignment: .leading) {
                Text("Available")
                    .font(.system(size: 16, weight: .semibold))
                LazyVGrid(columns: columnsForCircle, spacing: 20) {
                    ForEach(0..<8) { _ in
                        CircleCollection()
                    }
                }
            }.padding()
            informationView()
            designTypeView()
            requiredRoomView()
            Spacer()
        }.padding()
    }
    
    @ViewBuilder
    private func informationView() -> some View {
        VStack(alignment: .leading) {
            Text("All Information For You")
                .font(.system(size: 16, weight: .semibold))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<5) { _ in
                        RactangleCards()
                    }
                }
            }
        }.padding()
    }
    
    @ViewBuilder
    private func designTypeView() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Design Type")
                .font(.system(size: 16, weight: .semibold))
            LazyVGrid(columns: columnsForBox, spacing: 25) {
                ForEach(0..<8) { _ in
                    BoxCards()
                }
            }
        }.padding()
    }
    
    @ViewBuilder
    private func requiredRoomView() -> some View {
        VStack(alignment: .leading) {
            Text("Required Room Design")
                .font(.system(size: 16, weight: .semibold))
            VStack(alignment: .trailing){
                Image("RoomDes")
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/3.5)
                    .cornerRadius(16)
                Button {
                    
                }label: {
                    Text("Start to Cosultan")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(5)
                }
                .background(Color.orange)
                .cornerRadius(10)
            }.padding(.horizontal)
        }
    }
}

struct HomeTabItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabItem()
    }
}
