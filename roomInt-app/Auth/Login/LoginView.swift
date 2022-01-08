//
//  LoginView.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 28/12/21.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth
import LoadingButton

struct LoginView: View {
    @State private var isActive = false
    @State private var isLoginActive = false
    @StateObject private var viewModel = UserViewModel()
    @ObservedObject var session = SessionService.shared
    
    @EnvironmentObject var userAuth: UserAuth
    @State var currentNonce: String?
    @State var regist = false
    @State var signUp = false
    
    var style = LoadingButtonStyle(width: .infinity,
                                   height: 50,
                                   cornerRadius: 20,
                                   backgroundColor: Color.primaryColor,
                                   loadingColor: Color.primaryColor.opacity(0.5),
                                   strokeWidth: 5,
                                   strokeColor: .white)
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor.init(Color.primaryColor)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.init(Color.primaryColor)]
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    var body: some View {
        if viewModel.isLoginSuccess {
            
            if let user = session.user {
                if user.isDesainer {
                    DesignerView()
                }else {
                    CustomerView()
                }
            }
        } else {
            
            NavigationView {
                ScrollView {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    VStack(spacing: 10) {
                        TextInput(text: $viewModel.userData.email, placeholder: "Email", keyboardType: .default, isPass: false)
                        TextInput(text: $viewModel.userData.password, placeholder: "Password", keyboardType: .default, isPass: true)
                    }.padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Forgot password ?")
                                .foregroundColor(.black)
                        }.padding(.horizontal)
                        
                    }.padding(.bottom, 80)
                    
                    LoadingButton(action: {
                        viewModel.login()
                    }, isLoading: $viewModel.doneSignIn, style: style) {
                        Text("Login")
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.padding(.horizontal)
                    
                    SignInWithAppleButton(
                        onRequest: { request in
                            let nonce = randomNonceString()
                            currentNonce = nonce
                            request.requestedScopes = [.fullName, .email]
                            request.nonce = sha256(nonce)
                        },
                        onCompletion: { result in
                            switch result {
                            case .success(let authResults):
                                switch authResults.credential {
                                case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    
                                    guard let nonce = currentNonce else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let appleIDToken = appleIDCredential.identityToken else {
                                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                    }
                                    guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                        print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                        return
                                    }
                                    
                                    let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                    Auth.auth().signIn(with: credential) { (authResult, error) in
                                        if (error != nil) {
                                            print(error?.localizedDescription as Any)
                                            return
                                        }
                                        
                                        self.regist.toggle()
                                    }
                                default:
                                    break
                                    
                                }
                            default:
                                break
                            }
                        }
                    )
                        .frame(height: 48, alignment: .center)
                        .cornerRadius(50)
                        .padding()
                        .fullScreenCover(isPresented: $regist) {
                            UserRegisterView(isPresented: $regist)
                        }
                    
                    HStack {
                        Text("Already have an account? ")
                        NavigationLink(destination: SignupView(isPresented: $isActive), isActive: $isActive) {
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
                .padding(.horizontal, 16)
                .navigationTitle("Login")
                .navigationBarBackButtonHidden(true)
                .alert(isPresented: $viewModel.isAlertShow ) {
                    Alert(title: Text("Login failed"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("Ok")))
                }
                
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
