//
//  CatalogViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 06/01/22.
//

import Foundation
import Combine
import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension CatalogTabItem {
    class ViewModel: ObservableObject {
        @ObservedObject var session = SessionService.shared
        @Published var category: Category = .all
        @Published var interiors = [Interior]()
        @Published var allUser = [User]()
        @Published var filteredInteriors = [Interior]()
        private var subscriptions = Set<AnyCancellable>()
        private let store = Firestore.firestore().collection("Users")
        
        init() {
            fetchAllUser()
        }
        
        func fetchAllUser() {
            store.getDocuments { snapshot, error in
                guard let documents = RepositoryHelper.extractDocuments(snapshot, error) else { return }
                
                self.allUser = RepositoryHelper.extractData(from: documents, type: User.self)
                self.remove()
                for i in self.allUser {
                    if let interior = i.interiors {
                        self.interiors.append(contentsOf: interior)
                    }
                }
            }
            filterInter()
        }
        
        func filterInter() {
            $category.sink { [self] segment in
                self.filteredInteriors = interiors.filter { inter in
                    if segment == .all { return inter.category == .all} else if segment == .livingRoom { return inter.category == .livingRoom } else if segment == .bedroom { return inter.category == .bedroom} else { return inter.category == .kitchen}
                }
            }.store(in: &subscriptions)
        }
        
        func remove() {
            interiors = [Interior]()
        }
        
    }
}
