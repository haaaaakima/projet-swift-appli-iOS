import SwiftUI

struct SignUpFormView: View {
    @Environment(\.dismiss) var dismiss // Permet de fermer la vue actuelle
    @State private var navigateToLogin = false 
    @EnvironmentObject var viewModel: HelperViewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var isSignedUp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 80)
                    Image("logoBlancPNG")
                        .resizable()
                        .frame(width: 250, height: 125)
                    
                    Form {
                        Section(header: Text("Inscription")
                            .textCase(nil)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(-20)
                            .padding (.bottom, 20)
                            .foregroundColor(.white)) {
                            TextField("Prénom", text: $firstName)
                                .autocapitalization(.words)
                            if firstName.isEmpty && showError {
                                Text("Veuillez entrer un prénom").foregroundColor(.red).font(.caption)
                            }
                            
                            TextField("Nom", text: $lastName)
                                .autocapitalization(.words)
                            if lastName.isEmpty && showError {
                                Text("Veuillez entrer un nom").foregroundColor(.red).font(.caption)
                            }
                            
                            TextField("Email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            if (!email.contains("@") || !email.contains(".")) && showError {
                                Text("Veuillez entrer un email valide").foregroundColor(.red).font(.caption)
                            }
                            
                            TextField("Téléphone", text: $phoneNumber)
                                .keyboardType(.numberPad)
                            if phoneNumber.count < 10 && showError {
                                Text("Le numéro de téléphone doit comporter au moins 10 chiffres").foregroundColor(.red).font(.caption)
                            }
                            
                            SecureField("Mot de passe", text: $password)
                            if password.count < 6 && showError {
                                Text("Le mot de passe doit contenir au moins 6 caractères").foregroundColor(.red).font(.caption)
                            }
                            
                            SecureField("Confirmer le mot de passe", text: $confirmPassword)
                            if password != confirmPassword && showError {
                                Text("Les mots de passe ne correspondent pas").foregroundColor(.red).font(.caption)
                            }
                        }
                        
                        Section {
                            Button(action: registerUser) {
                                Text("S'inscrire")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.automatic)
                            .listRowBackground(Color.blue)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.customBlue)
                }
                .navigationDestination(isPresented: $isSignedUp) {
                    LoginFormView().environmentObject(viewModel)
                }        // Remplace Back par Retour
                .navigationBarBackButtonHidden(true) // Cacher le bouton par défaut
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
            }
        }
    }
    
    private func registerUser() {
        showError = true
        
        guard !firstName.isEmpty, !lastName.isEmpty, email.contains("@"), email.contains("."), phoneNumber.count >= 10, password.count >= 6, password == confirmPassword else {
            return
        }
        
        let newHelper = Helper(
            lastName: lastName,
            firstName: firstName,
            email: email,
            phoneNumber: Int(phoneNumber) ?? 0,
            password: password,
            image: "defaultProfileImage",
            status: false,
            points: 0
        )
        
        viewModel.addHelper(newHelper)
        print("Utilisateur ajouté à la liste des helpers.")
        isSignedUp = true
    }
}

#Preview {
    SignUpFormView()
        .environmentObject(HelperViewModel())
}
