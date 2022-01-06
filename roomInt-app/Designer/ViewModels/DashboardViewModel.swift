//
//  DashboardViewModel.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 06/01/22.
//

import Combine
import SwiftUI
import FirebaseAuth

extension DashboardTabItem {
    class ViewModel: ObservableObject {
        @ObservedObject var session = SessionService.shared
        @Published var category: Category = .all
        @Published var interiors = [Interior]()
        @Published var user: User?
        @Published var filteredInteriors = [Interior]()
        private var subscriptions = Set<AnyCancellable>()
        
        init() {
            fetchInter()
            filterInter()
        }
        
        func fetchInter() {
            if let user = session.user {
                self.user = user
                if let interior = user.interiors {
                        self.interiors = interior
                }
            }
        }
        
        func filterInter() {
            $category.sink { [self] segment in
                self.filteredInteriors = interiors.filter { inter in
                    if segment == .all { return inter.category == .all} else if segment == .livingRoom { return inter.category == .livingRoom } else if segment == .bedroom { return inter.category == .bedroom} else { return inter.category == .kitchen}
                }
            }.store(in: &subscriptions)
        }
    }
}
