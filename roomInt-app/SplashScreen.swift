//
//  SplashScreen.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 13/12/21.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isFinished = false

    var body: some View {
        if !isFinished {
            ZStack {
                Color.primaryColor
                Image("logo")
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.linear(duration: 1.5), {
                        isFinished.toggle()
                    })
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
