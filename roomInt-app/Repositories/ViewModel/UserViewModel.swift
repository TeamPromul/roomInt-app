//
//  UserViewModel.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 30/12/21.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var userData = User(name: "", email: "", password: "", phoneNumber: "", photo: "", isDesainer: false, interiors: [])
    @Published var image: UIImage?
    @Published var errorMessage = ""
    @Published var isAlertShow = false
    @Published var isLoginSuccess = false
    @Published var imageUpload = [UIImage]()
    @Published var doneSignIn = false
    @Published var user: User?
    @Published var doneSignUp = false
    
    @ObservedObject var session = SessionService.shared
    
    init() {
        if let id = Auth.auth().currentUser?.uid {
            getUser(userId: id)
        }
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
                self.doneSignUp.toggle()
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: userData.email, password: userData.password) {
            resul, err in
            if let err = err {
                self.errorMessage = err.localizedDescription
                self.isAlertShow.toggle()
                return
            }
            self.session.setup()
            self.isLoginSuccess = true
            self.doneSignIn.toggle()
        }
    }
    
    func logout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            SessionService.shared.user = nil
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func storeDataAppleId() {
        
        guard let imageUpload = imageUpload.first, let id = Auth.auth().currentUser?.uid else { return }
        
        StorageService.shared.upload(image: imageUpload, path: "\(id)profile\(UUID().uuidString)") { url, _ in
            
            guard let url = url?.absoluteString else { return }
            
            
            let user = User(name: self.userData.name, email: self.userData.email, password: self.userData.password, phoneNumber: self.userData.phoneNumber, photo: url, isDesainer: self.userData.isDesainer, interiors: self.userData.interiors)
            
            self.create(user)
            self.isLoginSuccess = true
            self.doneSignIn.toggle()
            
            
        }
    }
    
    func loginFromAppleId() {
        self.isLoginSuccess.toggle()
    }
    
    func getUserInformation() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        do {
            let snapshot = try await Firestore.firestore()
                .collection("Users").document(uid).getDocument()
            
            if let userData = try snapshot.data(as: User.self) {
                DispatchQueue.main.async {
                    self.userData = userData
                }
            }
        } catch {
            print(error)
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
    
    func getUser(userId: String) {
        UserRepository.shared.fetch(id: userId) { user in
            self.user = user
        }
    }
}
