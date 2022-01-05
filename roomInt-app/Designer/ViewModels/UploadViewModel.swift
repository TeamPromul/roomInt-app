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
        
        @ObservedObject var sessionService = SessionService.shared
        @ObservedObject private var UserRepository: UserRepository = .shared
        
        @Published var user: User?
        
        func placeOrder() {
            var inter = Interior(image: "", title: "", category: .all, price: "")
            sessionService.setup()
            
            inter.title = self.title
            inter.image = "test"
            inter.category = self.category
            inter.price = self.price
            
            var user = self.sessionService.user
            user?.interiors?.append(inter)
            if let user = user {
                self.UserRepository.update(customer: user) { user in
                    self.user = user
                }
                
            } else {
                print("no user")
                
            }
            
//            guard let imageUpload = image.first else { return }
//
//            StorageService.shared.upload(image: imageUpload, path: "\(UUID().uuidString)") { url, _ in
//
//                guard let url = url?.absoluteString else { return }
//
//                inter.title = self.title
//                inter.image = url
//                inter.category = self.category
//                inter.price = self.price
//
//                //InteriorViewModel.shared.add(inter: inter)
//
//                //self.addNewInterior(inter: inter)
//
//                var user = self.sessionService.user
//                user?.interiors?.append(inter)
//                if let user = user {
//                    self.UserRepository.update(customer: user) { user in
//                        self.user = user
//                    }
//
//                }
//            }
            
        }
        
        func addNewInterior(inter: Interior) {
            if var user = sessionService.user {
                user.interiors?.append(inter)
                UserRepository.update(customer: user) { user in
                    self.user = user
                }
            }
        }
        /*
         
         func addNew(motor: Motor) {
             if case .customer(var customer) = sessionService.user {
                 customer.motors?.append(motor)
                 customerRepository.update(customer: customer) { customer in
                     self.customer = customer
                 }
             }
         }
         */
        
    }
}
