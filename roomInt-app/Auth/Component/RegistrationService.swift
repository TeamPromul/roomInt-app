//
//  RegistrationService.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 28/12/21.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum RegistrationKeys: String {
    case name
    case phoneNumber
    case photo
}

protocol RegistrationService {
    func register(with details: Customer) -> AnyPublisher<Void, Error>
}

final class RegistrationServiceImplementation: RegistrationService {
    func register(with details: Customer) -> AnyPublisher<Void, Error> {
        Deferred {
            Future { promise in

                Auth.auth()
                    .createUser(withEmail: details.email, password: details.password) { res, error in
                        if let err = error {
                            promise(.failure(err))
                        } else {

                            if let uid = res?.user.uid {
                                let values: [String: Any] = [
                                    RegistrationKeys.name.rawValue: details.name,
                                    RegistrationKeys.phoneNumber.rawValue: details.phoneNumber,
                                    RegistrationKeys.photo.rawValue: details.photo ?? ""
                                ]

                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        if let error = error {
                                            promise(.failure(error))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }


                            } else {
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }

                        }
                    }

            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
