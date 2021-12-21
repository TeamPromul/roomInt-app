//
//  Designer.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import Foundation

struct Designer: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var phoneNumber: String
    var email: String
    var interiors: [Interior]?
}


extension Designer {
    static let preview = Designer(name: "Lita Batara", phoneNumber: "08983226781", email: "litabatara20@gmail.com", interiors: [
        Interior(image: "InteriorPreview", title: "Light Modern", category: .livingRoom, price: "Rp 500.000"),
        Interior(image: "InteriorPreview", title: "Light Modern", category: .bedroom, price: "Rp 400.000"),
        Interior(image: "InteriorPreview", title: "Light Modern", category: .kitchen, price: "Rp 300.000")
    ])
}
