//
//  OnBoardingBridge.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 14/12/21.
//

import SwiftUI

struct OnBoardingBridge: View {
    @ObservedObject var viewModel = OnBoardingViewModel()
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        if !viewModel.onboarding {
            OnBoarding()
                .overlay(SplashScreen())
        } else {
            LoginView()
                .overlay(SplashScreen())
        }
    }
}

struct OnBoardingBridge_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingBridge()
    }
}
