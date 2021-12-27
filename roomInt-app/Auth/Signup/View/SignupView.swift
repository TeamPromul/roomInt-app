//
//  SignupView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 27/12/21.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isCheck = false
    @State var nama = ""
    @Environment(\.openURL) var openURL

    var body: some View {
        ZStack {
            Image("bg-signup")
                .ignoresSafeArea()
            ScrollView {
                GeometryReader { proxy in
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            ZStack {
                                Circle()
                                    .foregroundColor(.primaryColor)
                                    .frame(width: 100, height: 100)
                                Image("icon-user")
                            }
                            Image("icon-plus")
                                .padding(.bottom, 14)

                        }.padding(.top, 100)

                        Text("Tambah foto profil")
                            .font(.system(size: 10))
                            .padding(.bottom, 50)

                        VStack(spacing: 10) {
                            TextInput(text: $nama, placeholder: "Nama", keyboardType: .default, isPass: false)
                            TextInput(text: $nama, placeholder: "Email", keyboardType: .emailAddress, isPass: false)
                            TextInput(text: $nama, placeholder: "Nomor HP", keyboardType: .phonePad, isPass: false)
                            TextInput(text: $nama, placeholder: "Password", keyboardType: .default, isPass: true)
                        }.padding(.bottom, 50)

                        HStack(spacing: 0) {
                            Button {
                                isCheck.toggle()
                            } label: {
                                Image(systemName: isCheck ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(.primaryColor)
                                    .padding(.trailing, 10)
                            }

                            Text("I have read and agree")
                                .font(.system(size: 14, weight: .bold))
                                .padding(.trailing, 2)
                            Button {
                                openURL(URL(string: "https://maize-magazine-0b4.notion.site/Term-Conditions-d7b707b771c4490496072fa24d559476")!)
                            } label: {
                                Text("Term and Conditions")
                                    .font(.system(size: 14, weight:  .bold))
                                    .foregroundColor(.secondaryColor)
                            }
                            Spacer()
                        }

                        Button(action: {}) {
                            Text("Signup")
                                .frame(width: proxy.size.width)
                        }
                        .buttonStyle(AuthButtonStyle())

                        HStack {
                            Text("Already have an account? ")
                            Button {
                                self.mode.wrappedValue.dismiss()
                            } label: {
                                Text("Login")
                                    .foregroundColor(.secondaryColor)
                            }

                        }.padding()
                    }
                }
                .padding()
            }
            .navigationTitle("Sign up")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignupView()
        }
    }
}
