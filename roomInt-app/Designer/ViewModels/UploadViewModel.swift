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
        
        func placeOrder() {
            var inter = Interior(image: "", title: "", category: .all, price: "")
            
            guard let imageUpload = image.first else { return }

            StorageService.shared.upload(image: imageUpload, path: "\(UUID().uuidString)") { url, _ in

                guard let url = url?.absoluteString else { return }
                
                inter.title = self.title
                inter.image = url
                inter.category = self.category
                inter.price = self.price

                InteriorViewModel.shared.add(inter: inter)

            }
            
        }
        
    }
}
