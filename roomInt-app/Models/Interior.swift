//
//  Interior.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import Foundation

struct Interior: Codable, Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var category: Category
    var price: String
    
}


enum Category: String, Codable, CaseIterable {
    case livingRoom = "Living Room"
    case bedroom = "Bedroom"
    case kitchen = "Kichen"
    
    var id: String { self.rawValue }
}
