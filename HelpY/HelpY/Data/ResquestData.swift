//
//  RequestData.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI
import CoreLocation

struct RequestData: Identifiable {
    let id = UUID()
    var category: String
    var description: String
    var distance: Double
    var duration: Int
    var date: Date
    var icon: String
    var statusRequired: Bool
    var organization: Organization
    var coordinate: CLLocationCoordinate2D
}

// Centre de Toulouse
let centerCoordinate = CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442)

// Tableau des demandes avec des coordonnées éparpillées autour du centre de Toulouse
let requestsData = [
    RequestData(category: "Courses", description: "Aider à faire les courses pour la semaine", distance: 1.5, duration: 30, date: Date(), icon: "cart", statusRequired: false, organization: organizationsData[0], coordinate: CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442)),
    RequestData(category: "Courses", description: "Acheter des produits frais au marché", distance: 2.5, duration: 40, date: Date(), icon: "cart", statusRequired: true, organization: organizationsData[1], coordinate: CLLocationCoordinate2D(latitude: 43.6058, longitude: 1.4405)),
    RequestData(category: "Courses", description: "Livrer des repas cuisinés", distance: 3.0, duration: 20, date: Date(), icon: "bag", statusRequired: false, organization: organizationsData[2], coordinate: CLLocationCoordinate2D(latitude: 43.6070, longitude: 1.4455)),
    RequestData(category: "Courses", description: "Récupérer des médicaments à la pharmacie", distance: 2.0, duration: 25, date: Date(), icon: "pills", statusRequired: true, organization: organizationsData[3], coordinate: CLLocationCoordinate2D()),
    
    RequestData(category: "Promener le chien", description: "Sortir le chien pour une balade courte", distance: 0.5, duration: 20, date: Date(), icon: "pawprint", statusRequired: false, organization: organizationsData[4], coordinate: CLLocationCoordinate2D(latitude: 43.6025, longitude: 1.4410)),
    RequestData(category: "Promener le chien", description: "Balade plus longue dans le parc", distance: 1.5, duration: 40, date: Date(), icon: "pawprint", statusRequired: false, organization: organizationsData[5], coordinate: CLLocationCoordinate2D(latitude: 43.6080, longitude: 1.4420)),
    RequestData(category: "Promener le chien", description: "Sortie quotidienne pour exercice", distance: 0.8, duration: 30, date: Date(), icon: "pawprint", statusRequired: false, organization: organizationsData[6], coordinate: CLLocationCoordinate2D(latitude: 43.6065, longitude: 1.4435)),
    RequestData(category: "Promener le chien", description: "Sortie du soir pour promenade rapide", distance: 0.3, duration: 15, date: Date(), icon: "pawprint", statusRequired: false, organization: organizationsData[7], coordinate: CLLocationCoordinate2D(latitude: 43.6035, longitude: 1.4470)),
    
    RequestData(category: "Préparation des repas", description: "Aider à cuisiner le déjeuner", distance: 2.0, duration: 40, date: Date(), icon: "fork.knife", statusRequired: true, organization: organizationsData[8], coordinate: CLLocationCoordinate2D(latitude: 43.6090, longitude: 1.4480)),
    RequestData(category: "Préparation des repas", description: "Préparer le dîner pour deux personnes", distance: 1.8, duration: 50, date: Date(), icon: "fork.knife", statusRequired: true, organization: organizationsData[9], coordinate: CLLocationCoordinate2D(latitude: 43.6100, longitude: 1.4425)),
    RequestData(category: "Préparation des repas", description: "Cuisiner des plats à emporter", distance: 2.2, duration: 60, date: Date(), icon: "fork.knife", statusRequired: true, organization: organizationsData[10], coordinate: CLLocationCoordinate2D(latitude: 43.6120, longitude: 1.4430)),
    RequestData(category: "Préparation des repas", description: "Préparer un goûter pour une occasion spéciale", distance: 1.5, duration: 35, date: Date(), icon: "fork.knife", statusRequired: false, organization: organizationsData[11], coordinate: CLLocationCoordinate2D(latitude: 43.6115, longitude: 1.4450)),
    
    RequestData(category: "Entretien de la maison", description: "Aide au ménage ou au rangement", distance: 1.8, duration: 60, date: Date(), icon: "house", statusRequired: true, organization: organizationsData[12], coordinate: CLLocationCoordinate2D(latitude: 43.6130, longitude: 1.4460)),
    RequestData(category: "Entretien de la maison", description: "Nettoyage des fenêtres", distance: 2.5, duration: 50, date: Date(), icon: "house", statusRequired: true, organization: organizationsData[13], coordinate: CLLocationCoordinate2D()),
    RequestData(category: "Entretien de la maison", description: "Rangement des placards", distance: 2.0, duration: 45, date: Date(), icon: "house", statusRequired: true, organization: organizationsData[14], coordinate: CLLocationCoordinate2D()),
    RequestData(category: "Entretien de la maison", description: "Aider avec le linge et le repassage", distance: 1.2, duration: 40, date: Date(), icon: "house", statusRequired: true, organization: organizationsData[15], coordinate: CLLocationCoordinate2D()),
    
    RequestData(category: "Accompagnement médical", description: "Conduire une personne à un rendez-vous médical", distance: 5.0, duration: 90, date: Date(), icon: "stethoscope", statusRequired: true, organization: organizationsData[16], coordinate: CLLocationCoordinate2D(latitude: 43.6030, longitude: 1.4465)),
    RequestData(category: "Accompagnement médical", description: "Attendre et ramener après un rendez-vous", distance: 4.0, duration: 120, date: Date(), icon: "stethoscope", statusRequired: true, organization: organizationsData[17], coordinate: CLLocationCoordinate2D()),
    RequestData(category: "Accompagnement médical", description: "Aider à remplir les papiers administratifs après une consultation", distance: 3.0, duration: 60, date: Date(), icon: "stethoscope", statusRequired: true, organization: organizationsData[18], coordinate: CLLocationCoordinate2D()),
    RequestData(category: "Accompagnement médical", description: "Assister une personne pendant un examen médical", distance: 6.0, duration: 100, date: Date(), icon: "stethoscope", statusRequired: true, organization: organizationsData[19], coordinate: CLLocationCoordinate2D())
]
