//
//  PrimaryButtonStyle.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 13/12/21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var fillColor: Color = .primaryButton
    func makeBody(configuration: Configuration) -> some View {
        return PrimaryButton(
            configuration: configuration,
            fillColor: fillColor
        )
    }

    struct PrimaryButton: View {
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

    struct PrimaryButtonStyle_Previews: PreviewProvider {
        static var previews: some View {
            Button(action: {}) {
                        Text("Next")
                    .padding(.horizontal, 100)
                    }
                    .buttonStyle(PrimaryButtonStyle())
        }
    }
