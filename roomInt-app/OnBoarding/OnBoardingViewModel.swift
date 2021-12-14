//
//  OnBoardingViewModel.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 14/12/21.
//

import Foundation
import SwiftUI

class OnBoardingViewModel: ObservableObject {
    @AppStorage("onboarding") var onboarding = false
    @Published var textTitle = [
        "Create your dream room on your hand!",
        "Find your favorite design architecture",
        "Discuss with expert in design architecture"
    ]

}
