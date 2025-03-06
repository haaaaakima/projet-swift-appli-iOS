//
//  OrganizationData.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct Organization: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var phoneNumber: Int
    var password: String
    var image: String
}

let organizationsData = [
    Organization(name: "Aidons Ensemble", email: "contact@aidonsensemble.org", phoneNumber: 1234567890, password: "password123", image: "person.crop.circle.fill"),
    Organization(name: "Solidarité Seniors", email: "info@solidariteseniors.com", phoneNumber: 1234567891, password: "securepass", image: "person.crop.circle.fill"),
    Organization(name: "Main Tendue", email: "hello@maintendue.fr", phoneNumber: 1234567892, password: "mypassword", image: "person.crop.circle.fill"),
    Organization(name: "Soutien Quotidien", email: "support@soutienquotidien.net", phoneNumber: 1234567893, password: "helpme123", image: "person.crop.circle.fill"),

    Organization(name: "Amitié Active", email: "contact@amitieactive.org", phoneNumber: 1234567894, password: "passactive", image: "person.crop.circle.fill"),
    Organization(name: "Bien Vieillir", email: "contact@bienvieillir.com", phoneNumber: 1234567895, password: "vieillir123", image: "person.crop.circle.fill"),
    Organization(name: "Soutien Plus", email: "hello@soutienplus.fr", phoneNumber: 1234567896, password: "plussecure", image: "person.crop.circle.fill"),
    Organization(name: "Aidons-les", email: "info@aidons-les.net", phoneNumber: 1234567897, password: "aidonsles123", image: "person.crop.circle.fill"),

    Organization(name: "Care Together", email: "contact@caretogether.org", phoneNumber: 1234567898, password: "care123", image: "person.crop.circle.fill"),
    Organization(name: "Partage et Aide", email: "support@partageaide.com", phoneNumber: 1234567899, password: "partage123", image: "person.crop.circle.fill"),
    Organization(name: "Les Bons Voisins", email: "contact@bonsvoisins.fr", phoneNumber: 1234567800, password: "voisins123", image: "person.crop.circle.fill"),
    Organization(name: "Coup de Main", email: "hello@coupdemain.org", phoneNumber: 1234567801, password: "coupde123", image: "person.crop.circle.fill"),

    Organization(name: "Espoir et Solidarité", email: "info@espoirsolidarite.net", phoneNumber: 1234567802, password: "espoir123", image: "person.crop.circle.fill"),
    Organization(name: "Vivons Ensemble", email: "support@vivonsensemble.org", phoneNumber: 1234567803, password: "vivons123", image: "person.crop.circle.fill"),
    Organization(name: "Entraide Proche", email: "contact@entraideproche.com", phoneNumber: 1234567804, password: "proche123", image: "person.crop.circle.fill"),
    Organization(name: "Sourire Solidaire", email: "hello@souriresolidaire.fr", phoneNumber: 1234567805, password: "sourire123", image: "person.crop.circle.fill"),

    Organization(name: "Appui Senior", email: "contact@appuiesenior.net", phoneNumber: 1234567806, password: "senior123", image: "person.crop.circle.fill"),
    Organization(name: "Voisins Aidants", email: "support@voisinsaidants.com", phoneNumber: 1234567807, password: "aidants123", image: "person.crop.circle.fill"),
    Organization(name: "Présence Solidaire", email: "info@presencesolidaire.org", phoneNumber: 1234567808, password: "presence123", image: "person.crop.circle.fill"),
    Organization(name: "Care and Help", email: "hello@careandhelp.com", phoneNumber: 1234567809, password: "help123", image: "person.crop.circle.fill")
]
