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
        @Published var userLogin: User?
        
        @ObservedObject var session = SessionService.shared
        @ObservedObject private var userRepo: UserRepository = .shared
        
        
        @Published var user: User?
        
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            self._isPresented = isPresented
            session.setup()
        }
        
        func storeDataAppleId() {
            if let user = session.user {
                self.userLogin = user
            }
            
            if userLogin == nil {
                if imageUpload.isEmpty {
                    guard let email = Auth.auth().currentUser?.email else { return }
                    
                    let user = User(name: self.userData.name, email: email, password: self.userData.password, phoneNumber: self.userData.phoneNumber, photo: "", isDesainer: self.userData.isDesainer, interiors: self.userData.interiors)
                    
                    self.create(user)
                    self.isPresented = false
                    self.isLoginSuccess = true
                    self.doneSignIn.toggle()
                    
                } else {
                    guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid, let email = Auth.auth().currentUser?.email else { return }
                    
                    StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                        
                        guard let url = url?.absoluteString else { return }
                        
                        let user = User(name: self.userData.name, email: email, password: self.userData.password, phoneNumber: self.userData.phoneNumber, photo: url, isDesainer: self.userData.isDesainer, interiors: self.userData.interiors)
                        
                        self.create(user)
                        self.isPresented = false
                        self.isLoginSuccess = true
                        self.doneSignIn.toggle()
                    }
                }
            } else {
                if var user = userLogin {
                    if imageUpload.isEmpty {
                        if self.userData.name != "" {
                            user.name = self.userData.name
                            userRepo.update(customer: user)
                            self.isPresented = false
                            self.doneSignIn = true
                            session.setup()
                            self.isLoginSuccess = true
                            
                        }else if self.userData.phoneNumber != "" {
                            user.phoneNumber = self.userData.phoneNumber
                            userRepo.update(customer: user)
                            self.isPresented = false
                            self.doneSignIn = true
                            session.setup()
                            self.isLoginSuccess = true
                            
                        } else if user.isDesainer != userData.isDesainer {
                            user.isDesainer = self.userData.isDesainer
                            userRepo.update(customer: user)
                            self.isPresented = false
                            self.doneSignIn = true
                            session.setup()
                            self.isLoginSuccess = true
                        } else if self.userData.phoneNumber != "" && self.userData.phoneNumber != "" && self.userData.isDesainer != user.isDesainer {
                            user.name = self.userData.name
                            user.phoneNumber = self.userData.phoneNumber
                            user.isDesainer = self.userData.isDesainer
                            userRepo.update(customer: user)
                            self.isPresented = false
                            self.doneSignIn = true
                            session.setup()
                            self.isLoginSuccess = true
                        }
                        else {
                            self.isPresented = false
                            self.doneSignIn = true
                            session.setup()
                            self.isLoginSuccess = true
                        }
                    } else {
                        if self.userData.name != "" {
                            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
                            
                            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                                
                                guard let url = url?.absoluteString else { return }
                                
                                user.name = self.userData.name
                                user.photo = url
                                
                                self.userRepo.update(customer: user)
                                self.isPresented = false
                                self.doneSignIn.toggle()
                                self.session.setup()
                                self.isLoginSuccess = true
                            }
                            
                        }else if self.userData.phoneNumber != "" {
                            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
                            
                            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                                
                                guard let url = url?.absoluteString else { return }
                                
                                user.phoneNumber = self.userData.phoneNumber
                                user.photo = url
                                
                                self.userRepo.update(customer: user)
                                self.isPresented = false
                                self.doneSignIn.toggle()
                                self.session.setup()
                                self.isLoginSuccess = true
                            }
                            
                        }else if user.isDesainer != userData.isDesainer {
                            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
                            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                            guard let url = url?.absoluteString else { return }
                                
                                user.isDesainer = self.userData.isDesainer
                                user.photo = url
                                self.userRepo.update(customer: user)
                                self.isPresented = false
                                self.doneSignIn.toggle()
                                self.session.setup()
                                self.isLoginSuccess = true
                            }
                        }
                        
                        else if self.userData.phoneNumber != "" && self.userData.phoneNumber != "" && self.userData.isDesainer != user.isDesainer{
                            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
                            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                            guard let url = url?.absoluteString else { return }
                                user.name = self.userData.name
                                user.phoneNumber = self.userData.phoneNumber
                                user.isDesainer = self.userData.isDesainer
                                user.photo = url
                                
                                self.userRepo.update(customer: user)
                                self.isPresented = false
                                self.doneSignIn.toggle()
                                self.session.setup()
                                self.isLoginSuccess = true
                            }
                        }else {
                            guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
                            StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
                            guard let url = url?.absoluteString else { return }
                                user.photo = url
                                self.userRepo.update(customer: user)
                                self.isPresented = false
                                self.doneSignIn.toggle()
                                self.session.setup()
                                self.isLoginSuccess = true
                            }
                        }
                    }
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
