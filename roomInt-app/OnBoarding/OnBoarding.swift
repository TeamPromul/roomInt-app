//
//  OnBoarding.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 13/12/21.
//

import SwiftUI

struct OnBoarding: View {
    @State var index = 0

    private let textTitle = [
        "Create your dream room on your hand!",
        "Find your favorite design architecture",
        "Discuss with expert in design architecture"
    ]

    var body: some View {
        GeometryReader { proxy in
            let contentSize = proxy.size.width - 36
            ZStack {
                Color.primaryColor
                VStack(spacing: 0) {
                    Group {
                        Image("Illustration\(index + 1)")
                            .resizable()
                            .frame(width: 345, height: 309, alignment: .center)
                        Group {
                            Text(textTitle[index])
                                .textH3Bold()
                                .padding(.top, 18)
                            Text("Lorem ipsun dolor sit amet, consectetur adipiscing elit. aenean eros diam massa sit euis mod aligquet nibh tortor city people.")
                                .textH5Regular()
                                .padding(.top, 16)
                        }
                        .frame(maxWidth: contentSize, minHeight: 20, alignment: .leading)
                    }

                    HStack {
                        Capsule()
                            .frame(width: (index == 0) ? 20: 8, height: 8)
                            .foregroundColor(Color.white)
                        Capsule()
                            .frame(width: (index == 1) ? 20: 8, height: 8)
                            .foregroundColor(Color.white)
                        Capsule()
                            .frame(width: (index == 2) ? 20: 8, height: 8)
                            .foregroundColor(Color.white)
                    }.padding()

                    HStack(spacing: 16) {
                        if index < 2 {
                            Button(action: {
                                index = 2
                            }) {
                                Text("Skip")
                                    .padding(.horizontal, 46)
                            }.buttonStyle(SecondaryButtonStyle())

                            Button(action: {
                                if index < 2 {
                                    index += 1
                                    print(index)
                                }
                            }) {
                                Text("Next")
                                    .padding(.horizontal, 46)
                            }.buttonStyle(PrimaryButtonStyle())
                        } else {
                            Button(action: {
                                
                            }) {
                                Text("Get Started")
                                    .frame(maxWidth: contentSize)
                            }.buttonStyle(PrimaryButtonStyle())
                        }




                    }.padding(.top, 40)
                }
                .frame(maxWidth: contentSize, maxHeight: proxy.size.height)
                .padding(.vertical, 90)
            }.ignoresSafeArea()

        }

    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding(index: 0)
            .overlay(SplashScreen())
    }
}
