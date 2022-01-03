//
//  InteriorViewModel.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 31/12/21.
//

import Foundation

class InteriorViewModel: ObservableObject {
    @Published var listInterior: [Interior]?


//    func fetchDataInterior() async {
//        do {
//            let documentSnapshot = try await FirebaseManager.shared.firestore.collection("User")
//                .whereField("isDesainer", isEqualTo: true)
//                .getDocuments()
//            print(<#T##items: Any...##Any#>)
//        } catch {
//            print(error)
//        }
//    }
}
