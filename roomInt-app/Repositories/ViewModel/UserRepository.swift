//
//  UserRepository.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserRepository: ObservableObject {
    static let shared = UserRepository()

    private let store = Firestore.firestore().collection("Users")

    private init() {}

    func fetch(id: String, completionHandler: ((User) -> Void)? = nil) {
        store.document(id).getDocument { document, error in
            do {
                if let data = try document?.data(as: User.self) {
                    completionHandler?(data)
                }
            } catch {
                print(error)
            }
        }
    }

    func add(customer: User, completionHandler: ((DocumentReference) -> Void)? = nil) {
        if let id = Auth.auth().currentUser?.uid {
            let docRef = store.document(id)
            do {
                try docRef.setData(from: customer)
                completionHandler?(docRef)
            } catch {
                RepositoryHelper.handleParsingError(error)
            }
        }
    }

    func remove(customer: User) {
        store.document(customer.id).delete()
    }

    func update(customer: User, completionHandler: ((User) -> Void)? = nil) {
        do {
            try store.document(customer.id).setData(from: customer, merge: true)
            fetch(id: customer.id) { updatedCustomer in
                completionHandler?(updatedCustomer)
            }
        } catch {
            RepositoryHelper.handleParsingError(error)
        }
    }
}
