//
//  LoginView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 28/12/21.
//

import SwiftUI

struct LoginView: View {
    @State private var isActive = false
    @State private var isLoginActive = false
    
    @StateObject private var viewModel = UserViewModel()
    
    
    
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
                        TextInput(text: $viewModel.userData.email, placeholder: "Email", keyboardType: .default, isPass: false)
                        TextInput(text: $viewModel.userData.password, placeholder: "Password", keyboardType: .default, isPass: true)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot password ?")
                                .foregroundColor(.black)
                        }
                        
                    }.padding(.bottom, 100)
                    
                    NavigationLink(destination: DesignerView(), isActive: $viewModel.isLoginSuccess) {
                        Button(action: {
                            Task {
                                await viewModel.login()
                            }
                            
                        }) {
                            Text("Login")
                                .frame(width: proxy.size.width)
                        }
                        .buttonStyle(AuthButtonStyle())
                    }
                    
                    
                    
                    HStack {
                        Text("Already have an account? ")
                        NavigationLink(destination: SignupView(), isActive: $isActive) {
                            Button {
                                isActive.toggle()
                            } label: {
                                Text("Signup")
                                    .foregroundColor(.secondaryColor)
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("Login")
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $viewModel.isAlertShow ) {
                Alert(title: Text("Login failed"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
