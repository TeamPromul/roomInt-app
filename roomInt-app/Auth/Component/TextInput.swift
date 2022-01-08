//
//  TextInput.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 27/12/21.
//

import SwiftUI

struct TextInput: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    @State var isPass = false
    


    var body: some View {
        Group {
            if isPass {
                SecureField(placeholder, text: $text)

            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .strokeBorder(Color.primaryColor, lineWidth: 2)
        )
        .background(RoundedRectangle(cornerRadius: 40).fill(Color.serachBarBg))
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(text: .constant(""), placeholder: "Nama", keyboardType: .default, isPass: true)
            .previewLayout(.sizeThatFits)
    }
}
