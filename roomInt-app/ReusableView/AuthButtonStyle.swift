//
//  AuthButtonStyle.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 27/12/21.
//

import SwiftUI

struct AuthButtonStyle: ButtonStyle {
    var fillColor: Color = .primaryColor
    func makeBody(configuration: Configuration) -> some View {
        return AuthButton(
            configuration: configuration,
            fillColor: fillColor
        )
    }

    struct AuthButton: View {
        let configuration: Configuration
        let fillColor: Color

        var body: some View {
            return configuration.label
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(
                        cornerRadius: 50
                    ).fill(
                        fillColor
                    )
                )
        }
    }
}

struct AuthButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Next")
                .padding(.horizontal, 100)
        }
        .buttonStyle(AuthButtonStyle())
    }
}
