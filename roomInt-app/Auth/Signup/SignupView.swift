//
//  SignupView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 27/12/21.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.openURL) var openURL

    @State var isCheck = false
    @State var isSignupActive = false
    @State var isShowImagePicker = false

    @StateObject private var viewModel = UserViewModel()


    var body: some View {
        ZStack {
            Image("bg-signup")
                .ignoresSafeArea()
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        Button {
                            isShowImagePicker.toggle()
                        } label: {
                            if let image = viewModel.image {
                                VStack {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(50)
                                        .background(
                                            RoundedRectangle(cornerRadius: 50)
                                                .stroke(Color.primaryColor, lineWidth: 2)
                                        )
                                    Text("Ubah foto profil")
                                        .font(.system(size: 10))
                                        .padding(.bottom, 50)
                                        .foregroundColor(.black)
                                }
                            } else {
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

                                    }
                                    Text("Tambah foto profil")
                                        .font(.system(size: 10))
                                        .padding(.bottom, 50)
                                        .foregroundColor(.black)
                                }
                            }

                        }.padding(.top, 100)
                        
                        VStack(spacing: 10) {
                            TextInput(text: $viewModel.userData.name, placeholder: "Nama", keyboardType: .default, isPass: false)
                            TextInput(text: $viewModel.userData.email, placeholder: "Email", keyboardType: .emailAddress, isPass: false)
                            TextInput(text: $viewModel.userData.phoneNumber, placeholder: "Nomor HP", keyboardType: .phonePad, isPass: false)
                            TextInput(text: $viewModel.userData.password, placeholder: "Password", keyboardType: .default, isPass: true)
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
                        NavigationLink(destination: CustomerView(), isActive: $isSignupActive) {
                            Button(action: {
                                Task {
                                    await viewModel.signup()
                                }
                                isSignupActive.toggle()
                                print("photo: \(viewModel.userData.photo)")
                                print("email: \(viewModel.userData.email)")
                                print("name: \(viewModel.userData.name)")
                            }) {
                                Text("Signup")
                                    .frame(width: proxy.size.width)
                            }
                            .buttonStyle(AuthButtonStyle())
                        }




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
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Sign up")
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $isShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $viewModel.image)
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
