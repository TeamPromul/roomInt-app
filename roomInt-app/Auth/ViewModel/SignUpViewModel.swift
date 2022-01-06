//
//  SignUpViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 05/01/22.
//

import Foundation
import FirebaseAuth
import SwiftUI

extension SignupView {
    class ViewModel: ObservableObject {
        
        @Published var userData = User(name: "", email: "", password: "", phoneNumber: "", photo: "", isDesainer: false, interiors: [])
        
        @Published var image: UIImage?
        @Published var errorMessage = ""
        @Published var isAlertShow = false
        @Published var isLoginSuccess = false
        @Published var imageUpload = [UIImage]()
        
        @Published var doneSignUp = false
        
        @Published var user: User?
        
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            self._isPresented = isPresented
        }
        
        func signup() {
            Auth.auth().createUser(withEmail: userData.email, password: userData.password) {
                result, err in
                if let err = err {
                    self.errorMessage = err.localizedDescription
                    self.isAlertShow.toggle()
                    return
                }
                self.userData.email = result?.user.email ?? ""
                guard let imageUpload = self.imageUpload.first else { return }
                
                StorageService.shared.upload(image: imageUpload, path: "\(String(describing: result?.user.uid))profile\(UUID().uuidString)") { url, _ in
                    guard let url = url?.absoluteString else { return }
                    
                    let user = User(name: self.userData.name, email: self.userData.email, password: self.userData.password, phoneNumber: self.userData.phoneNumber, photo: url, isDesainer: self.userData.isDesainer, interiors: self.userData.interiors)
                    
                    self.create(user)
                    self.isPresented = false
                    self.doneSignUp.toggle()
                }
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
