//
//  ForgotPasswordView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 28/12/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email = ""
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    Spacer(minLength: proxy.size.height/3)
                    TextInput(text: $email, placeholder: "Email", keyboardType: .emailAddress)
                }
                Button {

                } label: {
                    Text("Send Password Reset")
                        .frame(width: proxy.size.width)
                }.buttonStyle(AuthButtonStyle())
            }
        }
        .padding(.horizontal, 16)
        .navigationTitle("Reset Password")
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForgotPasswordView()
        }
    }
}
