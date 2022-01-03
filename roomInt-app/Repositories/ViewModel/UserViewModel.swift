//
//  UserViewModel.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 30/12/21.
//

import Foundation
import UIKit

class UserViewModel: ObservableObject {
    @Published var userData = User(name: "", email: "", password: "", phoneNumber: "", photo: "", isDesainer: false, interiors: [])

    @Published var image: UIImage?
    @Published var errorMessage = ""
    @Published var isAlertShow = false
    @Published var isLoginSuccess: Bool = false


    func signup() async {
        do {
            let result = try await FirebaseManager.shared.auth.createUser(withEmail: userData.email, password: userData.password)
            self.userData.email = result.user.email ?? ""
            self.uploadImageToStorage()
        } catch {
            self.errorMessage = error.localizedDescription
            self.isAlertShow.toggle()
        }
    }

    func login() async {
        do {
            let result = try await FirebaseManager.shared.auth.signIn(withEmail: userData.email, password: userData.password)

            self.getUserInformation()
            self.isLoginSuccess.toggle()
        } catch {
            self.errorMessage = error.localizedDescription
            self.isAlertShow.toggle()
        }
    }

    func logout() {
        try? FirebaseManager.shared.auth.signOut()
    }

    func uploadImageToStorage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
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
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
            let customerData = [
                "nama": self.userData.name,
                "email": self.userData.email,
                "uid": uid,
                "photo": self.userData.photo ?? "",
                "phoneNumber": self.userData.phoneNumber,
                "isDesainer": self.userData.isDesainer,
                "interiors": self.userData.interiors ?? []
            ] as [String : Any]
            try FirebaseManager.shared.firestore.collection("Users")
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

    func getUserInformation()  {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }

        FirebaseManager.shared.firestore
            .collection("Users").document(uid).getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to fetch current user: \(error)"
                    print("Failed to fetch current user:", error)
                    return
                }

                guard let dataUser = snapshot?.data() else {
                    self.errorMessage = "No data found"
                    return

                }
                self.userData.interiors = dataUser["interiors"] as? [Interior] ?? []
                self.userData.isDesainer = dataUser["isDesainer"] as? Bool ?? false
                self.userData.name = dataUser["nama"] as? String ?? ""
                self.userData.phoneNumber = dataUser["phoneNumber"] as? String ?? ""
                self.userData.email = dataUser["email"] as? String ?? ""
                self.userData.photo = dataUser["photo"] as? String ?? ""
            }
    }
}
