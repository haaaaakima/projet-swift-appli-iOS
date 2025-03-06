//
//  HelperViewModel.swift
//  HelpY
//
//  Created by Apprenant 45 on 03/02/2025.
//

import Foundation

class HelperViewModel: ObservableObject {
    @Published var storedHelpers: [Helper] = []
    
    init() {
        loadHelpers() // Charger les helpers à l'initialisation
    }

    func addHelper(_ helper: Helper) {
        print("Ajout de l'utilisateur : \(helper.firstName) \(helper.lastName)")
        storedHelpers.append(helper)
        saveHelpers() // Sauvegarder après avoir ajouté un utilisateur
    }

    func authenticateUser(email: String, password: String) -> Helper? {
        return storedHelpers.first { helper in
            helper.email.lowercased() == email.lowercased() && helper.password == password
        }
    }

    private func saveHelpers() {
        // Sauvegarde les données dans un fichier JSON
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Formatage lisible
        
        do {
            let data = try encoder.encode(storedHelpers) // Encode le tableau `storedHelpers`
            let url = getDocumentsDirectory().appendingPathComponent("helpersData.json") // Chemin du fichier
            try data.write(to: url) // Sauvegarde les données dans ce fichier
        } catch {
            print("Erreur lors de la sauvegarde des données : \(error)")
        }
    }

    private func loadHelpers() {
        if let loadedHelpers = loadHelpersFromJSON() { // Tente de charger les données
            storedHelpers = loadedHelpers
        } else {
            storedHelpers = helpersData // Si le fichier JSON est introuvable, charge les données par défaut
        }
    }
    
    private func loadHelpersFromJSON() -> [Helper]? {
        // Charge les données depuis le fichier JSON
        let decoder = JSONDecoder()
        do {
            let url = getDocumentsDirectory().appendingPathComponent("helpersData.json") // Chemin du fichier
            let data = try Data(contentsOf: url) // Charge les données
            let decodedHelpers = try decoder.decode([Helper].self, from: data) // Décode les données
            return decodedHelpers
        } catch {
            print("Erreur lors du chargement des données : \(error)")
            return nil
        }
    }

    private func getDocumentsDirectory() -> URL {
        // Fonction qui retourne le répertoire Documents de l'app
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] // Retourne le premier chemin trouvé
    }
}
