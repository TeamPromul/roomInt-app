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
    
    
    init() {
        if let id = Auth.auth().currentUser?.uid {
            getUser(userId: id)
        }
    }

    func signup() async {
        do {
            let result = try await Auth.auth().createUser(withEmail: userData.email, password: userData.password)
            self.userData.email = result.user.email ?? ""
            self.uploadImageToStorage()
        } catch {
            self.errorMessage = error.localizedDescription
            self.isAlertShow.toggle()
        }
    }

    func login() async {
        do {
            let result = try await Auth.auth().signIn(withEmail: userData.email, password: userData.password)

            await self.getUserInformation()
            self.isLoginSuccess.toggle()
        } catch {
            self.errorMessage = error.localizedDescription
            self.isAlertShow.toggle()
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
                self.doneSignIn.toggle()
                self.isLoginSuccess = true
            
        }
    }

    func loginFromAppleId() {
        self.isLoginSuccess.toggle()
    }
    

    func uploadImageToStorage() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Storage.storage().reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }

        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "Failed to push image to Storage: \(err)"
                return
            }

            ref.downloadURL { url, err in
                if let err = err {
                    self.errorMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }

                self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                self.userData.photo = url?.absoluteString ?? ""
                self.storeUserInformation()
                print(url?.absoluteString ?? "")
                print(self.errorMessage)
            }
        }
    }

    func storeUserInformation() {
        do {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let customerData = [
                "nama": self.userData.name,
                "email": self.userData.email,
                "uid": uid,
                "photo": self.userData.photo ?? "",
                "phoneNumber": self.userData.phoneNumber,
                "isDesainer": self.userData.isDesainer,
                "interiors": self.userData.interiors ?? []
            ] as [String : Any]
            try Firestore.firestore().collection("Users")
                .document(uid).setData(customerData) { error in
                    if let error = error {
                        print("Error writing document: \(error)")
                    }
                    else {
                        print("Document saved successfully")
                    }
                }
        } catch {
            print("Error writing document: \(error)")
        }


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
