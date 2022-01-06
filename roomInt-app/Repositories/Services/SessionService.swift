//
//  SessionService.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

final class SessionService: ObservableObject {
    // Shared Instance
    static let shared = SessionService()

    @Published var user: User?

    func setup() {
        if let userId = Auth.auth().currentUser?.uid {
            UserRepository.shared.fetch(id: userId) { [weak self] customer in
                self?.user = customer
            }
        }
    }

    static var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'GoogleService-Info.plist'.")
        }

        let plist = NSDictionary(contentsOfFile: filePath)

        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'GoogleService-Info.plist'.")
        }

        return value
    }
}

