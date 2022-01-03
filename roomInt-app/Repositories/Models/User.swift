//
//  Customer.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import Foundation


struct User: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var email: String
    var password: String
    var phoneNumber: String
    var photo: String?
    var isDesainer: Bool
    var interiors: [Interior]?
}

extension User {
    static let preview = User(name: "Rangga", email: "dirgabuwono@gmail.com",password: "", phoneNumber: "085156090022", isDesainer: false)
    static let previewDesainer = User(name: "Lita Batara", email: "litabatara20@gmail.com", password: "", phoneNumber: "08983226781",isDesainer: true, interiors: [
        Interior(image: "InteriorPreview", title: "Light Modern", category: .livingRoom, price: "Rp 500.000"),
        Interior(image: "InteriorPreview", title: "Light Modern", category: .bedroom, price: "Rp 400.000"),
        Interior(image: "InteriorPreview", title: "Light Modern", category: .kitchen, price: "Rp 300.000")
    ])

    static var new: User {
        User(name: "", email: "", password: "", phoneNumber: "", photo: "", isDesainer: false, interiors: [])
    }
}
