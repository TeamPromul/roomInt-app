//
//  Customer.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 21/12/21.
//

import Foundation


struct Customer: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var email: String
    var phoneNumber: String
    var photo: String?
}

extension Customer {
    static let preview = Customer(name: "Rangga", email: "dirgabuwono@gmail.com", phoneNumber: "085156090022")
}
