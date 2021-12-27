//
//  LoginView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 28/12/21.
//

import SwiftUI

struct LoginView: View {
    @State var nama = ""
    @State private var isActive = false


    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor.init(Color.primaryColor)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.init(Color.primaryColor)]
    }



    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                    ScrollView {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        VStack(spacing: 10) {
                            TextInput(text: $nama, placeholder: "Nama", keyboardType: .default, isPass: false)
                            TextInput(text: $nama, placeholder: "Password", keyboardType: .default, isPass: true)
                        }

                        HStack {
                            Spacer()
                            Button {

                            } label: {
                                Text("Forgot password ?")
                                    .foregroundColor(.black)
                            }

                        }.padding(.bottom, 100)

                        Button(action: {}) {
                            Text("Login")
                                .frame(width: proxy.size.width)
                        }
                        .buttonStyle(AuthButtonStyle())

                        HStack {
                            Text("Already have an account? ")
                            NavigationLink(destination: SignupView(), isActive: self.$isActive) {
                                Button {
                                    self.isActive.toggle()
                                } label: {
                                    Text("Signup")
                                        .foregroundColor(.secondaryColor)
                                }
                            }
                        }
                        .padding()
                    }
                }
                .padding(16)
                .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
            LoginView()
    }
}
