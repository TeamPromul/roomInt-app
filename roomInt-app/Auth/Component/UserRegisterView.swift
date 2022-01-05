//
//  UserRegisterView.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 04/01/22.
//

import SwiftUI
import LoadingButton

struct UserRegisterView: View {
    @Environment(\.openURL) var openURL
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: ViewModel
    
    @State var isCheck = false
    @State var isShowImagePicker = false
    @State private var showActionSheet = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
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
        if viewModel.isLoginSuccess {
            if viewModel.userData.isDesainer {
                DesignerView()
            } else {
                CustomerView()
            }
        } else {
            NavigationView {
                ScrollView {
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

                    }.padding(.top, 100)
                    
                    
                    VStack(spacing: 10) {
                        TextInput(text: $viewModel.userData.name, placeholder: "Nama", keyboardType: .default, isPass: false)
                        TextInput(text: $viewModel.userData.phoneNumber, placeholder: "Nomor HP", keyboardType: .phonePad, isPass: false)
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
                            
                        }.padding(.bottom, 50)
                    }
                    
                    Spacer()
                    
                    VStack {
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
                            viewModel.storeDataAppleId()
                        }, isLoading: $viewModel.doneSignIn, style: style) {
                            Text("SignUp")
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                    }
                }
                .padding()
                .navigationBarTitle("SignUp")
                .sheet(isPresented: $isShowImagePicker) {            ImagePickerHelper(sourceType: sourceType, pickerResult: $viewModel.imageUpload)
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("Choose mode"),
                        message: Text("Please choose your preferred mode to set your profile image"),
                        buttons: [
                            .default(Text("Camera")) {
                                self.isShowImagePicker.toggle()
                                self.sourceType = .camera
                            },
                            .default(Text("Photo Library")) {
                                self.isShowImagePicker.toggle()
                                self.sourceType = .photoLibrary
                            },
                            .cancel()
                        ]
                    )
                }
            }
            
        }
        
    }
}

struct UserRegisterView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegisterView(isPresented: .constant(true))
    }
}
