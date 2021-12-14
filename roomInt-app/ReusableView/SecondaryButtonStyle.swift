//
//  SecondaryButtonStyle.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 13/12/21.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return SecondaryButton(
            configuration: configuration
        )
    }

    struct SecondaryButton: View {
        let configuration: Configuration

        var body: some View {
            return configuration.label
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.white, lineWidth: 2)

                )
        }
    }
}

struct SecondaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("Next")
                .padding(.horizontal, 100)
        }
        .buttonStyle(SecondaryButtonStyle())
        .preferredColorScheme(.dark)
    }
}

