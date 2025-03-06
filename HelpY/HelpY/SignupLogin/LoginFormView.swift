//
//  NotificationsView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

extension Color {
    static let customBlue = Color(UIColor(red: 106/255, green: 186/255, blue: 246/255, alpha: 1.0))
}

struct LoginFormView: View {
    @StateObject var viewModel = HelperViewModel()
    @AppStorage("userName") private var name = ""
    @AppStorage("userEmail") private var email = ""
    @AppStorage("stayConnected") private var stayConnected = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var password = ""
    @State private var showAuthError = false
    @State private var authErrorMessage = ""

    var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && email.contains("@") && email.contains(".")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                VStack {
                    Image("logoBlancPNG")
                        .resizable()
                        .frame(width: 300, height: 150)
                        .transition(.opacity)
                    
                    Form {
                        Section(header: Text("")) {
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .textContentType(.emailAddress)
                                .frame(height: 40)
                            
                            HStack {
                                SecureField("Mot de passe", text: $password)
                                    .textContentType(.password)
                                Section {
                                    Button(action: {
                                        submitForm()
                                    }) {
                                        Image(systemName: "arrowshape.forward.circle")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color(.gray))
                                    }
                                    .buttonStyle(.automatic)
                                    .disabled(!isFormValid)
                                    .opacity(isFormValid ? 1 : 0.75)
                                }
                            }.frame(height: 40)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.customBlue)
                } .padding(.top, 80)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Rester connecté")
                            .foregroundColor(.white)
                        Toggle("", isOn: $stayConnected)
                            .labelsHidden()
                    } .padding(.top, 400)
                    
                    Spacer()
                    
                    HStack {
                        Text("Pas de compte ?")
                        NavigationLink(destination: SignUpFormView()) {
                            Text("Le créer maintenant")
                                .bold()
                                .underline()
                        }
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical)
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "apple.logo")
                            Text("Connexion avec Apple")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                }.padding()
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                LandingScreenView()
                    .environmentObject(viewModel)
            }
            .alert(isPresented: $showAuthError) {
                Alert(
                    title: Text("Erreur de connexion"),
                    message: Text(authErrorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    private func submitForm() {
        if let foundUser = viewModel.authenticateUser(email: email, password: password) {
            name = "\(foundUser.firstName) \(foundUser.lastName)"
            isLoggedIn = true
            showAuthError = false
        } else {
            // Si l'utilisateur n'est pas trouvé, afficher une alerte.
            if email.isEmpty || password.isEmpty {
                authErrorMessage = "Veuillez entrer un email et un mot de passe valides."
            } else {
                authErrorMessage = "Identifiants incorrects. Vérifiez votre email et mot de passe."
            }
            showAuthError = true
        }
    }
}

#Preview {
    LoginFormView()
        .environmentObject(HelperViewModel())
}


