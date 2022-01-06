//
//  UploadViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Combine

extension UploadInteriorView {
    class ViewModel: ObservableObject {
        
        @Published var title = ""
        @Published var category: Category = .all
        @Published var price = ""
        @Published var docRef: DocumentReference?
        @Published var image = [UIImage]()
        @Published var errorMessage = ""
        @Published var inter = Interior(userName: "", image: "", title: "", category: .all, price: "")
        
        @Published var doneUpload = false
        @Published var isPresented = false
        
        @ObservedObject var sessionService = SessionService.shared
        @ObservedObject private var UserRepository: UserRepository = .shared
        
        @Published var user: User?
        
        func placeOrder() {
            
            sessionService.setup()
            guard let imageUpload = image.first else { return }
            StorageService.shared.upload(image: imageUpload, path: "\(UUID().uuidString)") { url, _ in

                guard let url = url?.absoluteString else { return }
                var user = self.sessionService.user
                
                self.inter.title = self.title
                self.inter.image = url
                self.inter.category = self.category
                self.inter.price = self.price
                
                if let user = user {
                    self.inter.userName = user.name
                }
                
                user?.interiors?.append(self.inter)
                
                if let user = user {
                    self.UserRepository.update(customer: user) { user in
                        self.user = user
                        self.doneUpload = true
                        self.isPresented.toggle()
                
                    }

                }
            }
            
        }
        
        func addNewInterior(inter: Interior) {
            if var user = sessionService.user {
                user.interiors?.append(inter)
                UserRepository.update(customer: user) { user in
                    self.user = user
                }
            }
        }
    }
}
