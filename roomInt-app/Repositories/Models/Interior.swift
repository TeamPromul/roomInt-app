//
//  Interior.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import Foundation

struct Interior: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    var userName: String
    var image: String
    var title: String
    var category: Category
    var price: String
    
}


enum Category: String, Codable, CaseIterable {
    case all = "All"
    case livingRoom = "Living Room"
    case bedroom = "Bedroom"
    case kitchen = "Kichen"
}


extension Interior {
    static let preview = Interior(userName: "Rangga", image: "HomeBg", title: "Living Room like office", category: .livingRoom, price: "Rp. 500.000")
}
