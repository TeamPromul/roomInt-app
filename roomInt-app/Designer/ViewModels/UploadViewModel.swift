//
//  UploadViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import Combine

extension UploadInteriorView {
    class ViewModel: ObservableObject {
        
        @Published var title = ""
        @Published var image = "https://www.google.com/imgres?imgurl=https%3A%2F%2Fsobatgame.com%2Fwp-content%2Fuploads%2F2019%2F08%2FNintendo-DS.jpg&imgrefurl=https%3A%2F%2Fsobatgame.com%2Fnintendo-ds%2F&tbnid=LoDzIBeuQv6J8M&vet=12ahUKEwiJu5CS3pb1AhVCzqACHe08CwcQMygBegUIARCCAQ..i&docid=s0hjrL_fTWsjUM&w=3200&h=2700&q=ds&ved=2ahUKEwiJu5CS3pb1AhVCzqACHe08CwcQMygBegUIARCCAQ"
        @Published var category: Category = .all
        @Published var price = ""

        @Published var docRef: DocumentReference?



        func placeOrder(completionHandler: ((DocumentReference) -> Void)? = nil) {
            var inter = Interior(image: "", title: "", category: .all, price: "")
            inter.title = title
            inter.image = image
            inter.category = category
            inter.price = price
            
            InteriorViewModel.shared.add(inter: inter) { docRef in
                completionHandler?(docRef)
            }
        }
    }
}
