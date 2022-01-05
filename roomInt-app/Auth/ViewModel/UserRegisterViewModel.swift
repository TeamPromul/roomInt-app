//
//  UserRegisterViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Firebase

extension UserRegisterView {
    class ViewModel: ObservableObject {
        
        @Published var userData = User(name: "", email: "", password: "", phoneNumber: "", photo: "", isDesainer: false, interiors: [])
        
        @Published var image: UIImage?
        @Published var errorMessage = ""
        @Published var isAlertShow = false
        @Published var isLoginSuccess = false
        @Published var imageUpload = [UIImage]()
        
        @Published var doneSignIn = false
        
        @Published var user: User?
        
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            self._isPresented = isPresented
        }
        
        func storeDataAppleId() {
            
            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
            
            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                
                guard let url = url?.absoluteString else { return }
                
                let user = User(name: self.userData.name, email: self.userData.email, password: self.userData.password, phoneNumber: self.userData.phoneNumber, photo: url, isDesainer: self.userData.isDesainer, interiors: self.userData.interiors)
                
                self.create(user)
                self.isPresented = false
                self.isLoginSuccess = true
                self.doneSignIn.toggle()
                
                
            }
        }
        
        func create(_ customer: User, completionHandler: ((User) -> Void)? = nil) {
            UserRepository.shared.add(customer: customer) { docRef in
                docRef.getDocument { snapshot, _ in
                    if let snapshot = snapshot {
                        do {
                            if let customer = try snapshot.data(as: User.self) {
                                SessionService.shared.user = customer
                                completionHandler?(customer)
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
        
    }
}
