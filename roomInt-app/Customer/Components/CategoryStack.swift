//
//  CategoryStack.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 03/01/22.
//

import SwiftUI

struct CategoryStack: View {
    var cats: Category
    var isSelected: Bool
    var onSelect: ((Category) -> Void) = {_ in}
    var body: some View {
        VStack{
            Image("HomeBg")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(isSelected ? Color.primaryColor : Color.clear, lineWidth: 3))
            Text(cats.rawValue)
                .font(.system(size: 10))
        }.onTapGesture {
            self.onSelect(self.cats)
        }

    }
}

struct CategoryStack_Previews: PreviewProvider {
    static var previews: some View {
        CategoryStack(cats: .all, isSelected: true)
    }
}
