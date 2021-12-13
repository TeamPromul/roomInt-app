//
//  OnBoardingBridge.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 14/12/21.
//

import SwiftUI

struct OnBoardingBridge: View {
    @AppStorage("onboarding") var onboarding = false
    var body: some View {
        if !onboarding {
            OnBoarding()
                .overlay(SplashScreen())
                .onAppear {
                    onboarding = true
                }
        } else {
            ContentView()
                .overlay(SplashScreen())
        }

    }
}

struct OnBoardingBridge_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingBridge()
    }
}
