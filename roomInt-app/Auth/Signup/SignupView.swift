//
//  SignupView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 27/12/21.
//

import SwiftUI
import LoadingButton

struct SignupView: View {
    @Environment(\.openURL) var openURL
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @StateObject var viewModel: ViewModel
    @State var isCheck = false
    @State var isSignupActive = false
    @State var isShowImagePicker = false
    
    var style = LoadingButtonStyle(width: .infinity,
                                   height: 50,
                                   cornerRadius: 20,
                                   backgroundColor: Color.primaryColor,
                                   loadingColor: Color.primaryColor.opacity(0.5),
                                   strokeWidth: 5,
                                   strokeColor: .white)
    
    init(isPresented: Binding<Bool>) {
        let viewModel = ViewModel(isPresented: isPresented)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    Button {
                        isShowImagePicker.toggle()
                    } label: {
                        if !viewModel.imageUpload.isEmpty {
                            VStack {
                                Image(uiImage: viewModel.imageUpload[0])
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
                        
                    }.padding(.top)
                    
                    VStack(spacing: 10) {
                        TextInput(text: $viewModel.userData.name, placeholder: "Nama", keyboardType: .default, isPass: false)
                        TextInput(text: $viewModel.userData.email, placeholder: "Email", keyboardType: .emailAddress, isPass: false)
                        TextInput(text: $viewModel.userData.phoneNumber, placeholder: "Nomor HP", keyboardType: .phonePad, isPass: false)
                        TextInput(text: $viewModel.userData.password, placeholder: "Password", keyboardType: .default, isPass: true)
                        HStack {
                            Text("Select Your Role")
                                .foregroundColor(Color.secondaryColor)
                            Spacer()
                            Picker("Role", selection: $viewModel.userData.isDesainer, content: {
                                Text("Designer").tag(true)
                                Text("Customer").tag(false)
                            })
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .strokeBorder(Color.primaryColor, lineWidth: 2)
                                )
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.white))
                            
                        }
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
                    
                    LoadingButton(action: {
                        viewModel.signup()
                    }, isLoading: $viewModel.doneSignUp, style: style) {
                        Text("SignUp")
                            .foregroundColor(.white)
                            .cornerRadius(10)
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
        .navigationTitle("Sign up")
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isShowImagePicker) {
            ImagePickerHelper(sourceType: sourceType, pickerResult: $viewModel.imageUpload)
        }
        .alert(isPresented: $viewModel.isAlertShow ) {
            Alert(title: Text("SignUp failed"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignupView(isPresented: .constant(true))
        }
    }
}
