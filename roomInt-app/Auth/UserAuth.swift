//
//  UserAuth.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Combine
import FirebaseAuth

class UserAuth: ObservableObject {
    @Published var isLoggedin: Bool = false
    
    func login() {
        self.isLoggedin = true
    }
    
    
}
