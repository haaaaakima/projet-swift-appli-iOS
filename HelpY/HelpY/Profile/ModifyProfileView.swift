//
//  ModifyProfileView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct ModifyProfileView: View {
    @Environment(\.dismiss) var dismiss // Permet de fermer la vue actuelle
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("userName") private var userName: String = ""
    @State private var showConfirmation: Bool = false
    @State private var navigateToLogin = false
    
    let helper = helpersData[0] // Vous pouvez remplacer cette partie si nécessaire
    
    var body: some View {
        VStack {
            // Modifier photo de profil
            VStack {
                Image(helper.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(180)
                
                Text("Modifier la photo de profil")
                    .foregroundColor(Color.gray)
            }
            .padding(.top, 30)
            
            Divider()
            
            // Formulaire
            VStack(spacing: 20) {
                // Nom
                TextField("Nom", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .padding(.horizontal)

                // Prénom
                TextField("Prénom", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .padding(.horizontal)

                // Adresse mail
                TextField("Adresse mail", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding(.horizontal)

                // Téléphone
                TextField("Téléphone", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .keyboardType(.phonePad)
                    .padding(.horizontal)

                // Mot de passe
                SecureField("Mot de passe", text: .constant(""))
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 30)
            
            // Bouton Valider
            Button(action: {
                // Action pour valider le formulaire
            }) {
                Text("Valider")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 15)
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 30)
            
            Spacer()
            
            // Bouton Déconnexion
            Button(action: {
                // Déconnexion de l'utilisateur
                showConfirmation.toggle() // Afficher la confirmation de déconnexion
            }) {
                Text("Déconnexion")
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(20)
            }
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Confirmer la déconnexion"),
                    message: Text("Êtes-vous sûr de vouloir vous déconnecter ?"),
                    primaryButton: .destructive(Text("Se déconnecter")) {
                        // Action de déconnexion
                        isLoggedIn = false // Déconnexion
                        userEmail = "" // Réinitialiser l'email
                        userName = "" // Réinitialiser le nom
                        navigateToLogin = true // Déclenche la navigation vers la page de connexion
                    },
                    secondaryButton: .cancel()
                )
            }
            
            // Navigation vers LoginFormView
            NavigationLink(destination: LoginFormView().navigationBarBackButtonHidden(true), isActive: $navigateToLogin) {
                EmptyView() // Il n'y a pas besoin de bouton ou de visuel ici, juste un déclencheur invisible
            }
        }
        .navigationBarBackButtonHidden(true) // Cacher le bouton retour dans la vue actuelle
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss() // Revenir à la vue précédente
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Retour")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        ModifyProfileView()
    }
}
