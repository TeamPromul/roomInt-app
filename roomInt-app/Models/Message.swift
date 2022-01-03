//
//  Message.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 27/12/21.
//

import Foundation

struct Message {
    var content: String
    var user: Designer
}

extension Message {
    static let preview = Message(content: "Hello dude", user: Designer(name: "Rangga", phoneNumber: "0821", email: "dirgabuwono@gmail.com"))
}
