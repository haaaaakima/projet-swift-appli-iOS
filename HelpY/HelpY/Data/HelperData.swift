//
//  HelperData.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//
import SwiftUI

struct Helper: Identifiable, Codable {
    var id: UUID? = UUID() // Rendre `id` optionnel
    var lastName: String
    var firstName: String
    var email: String
    var phoneNumber: Int
    var password: String
    var image: String
    var status: Bool
    var points: Int
}

let helpersData = [
    Helper(lastName: "Dupont", firstName: "Marie", email: "marie.dupont@example.com", phoneNumber: 1234567890, password: "password123", image: "ainoy", status: true, points: 150),
    Helper(lastName: "Durand", firstName: "Paul", email: "paul.durand@example.com", phoneNumber: 1234567891, password: "securepass", image: "jo", status: false, points: 120),
    Helper(lastName: "Moreau", firstName: "Claire", email: "claire.moreau@example.com", phoneNumber: 1234567892, password: "mypassword", image: "akashi", status: true, points: 200),
    Helper(lastName: "Lemoine", firstName: "Jean", email: "jean.lemoine@example.com", phoneNumber: 1234567893, password: "jean1234", image: "joseph", status: false, points: 90),

    Helper(lastName: "Martin", firstName: "Lucie", email: "lucie.martin@example.com", phoneNumber: 1234567894, password: "luciemartin", image: "jimmy", status: true, points: 175),
    Helper(lastName: "Bernard", firstName: "Julien", email: "julien.bernard@example.com", phoneNumber: 1234567895, password: "julienpass", image: "phil", status: false, points: 100),
    Helper(lastName: "Fabre", firstName: "Sophie", email: "sophie.fabre@example.com", phoneNumber: 1234567896, password: "fabresophie", image: "robert", status: true, points: 210),
    Helper(lastName: "Roux", firstName: "Antoine", email: "antoine.roux@example.com", phoneNumber: 1234567897, password: "antoineroux", image: "stefan", status: false, points: 130),

    Helper(lastName: "Petit", firstName: "Isabelle", email: "isabelle.petit@example.com", phoneNumber: 1234567898, password: "isapetit", image: "profile9", status: true, points: 160),
    Helper(lastName: "Garnier", firstName: "Louis", email: "louis.garnier@example.com", phoneNumber: 1234567899, password: "louispass", image: "profile10", status: false, points: 95),
    Helper(lastName: "Chevalier", firstName: "Emma", email: "emma.chevalier@example.com", phoneNumber: 1234567800, password: "emmapass", image: "profile11", status: true, points: 220),
    Helper(lastName: "Blanc", firstName: "Marc", email: "marc.blanc@example.com", phoneNumber: 1234567801, password: "marcblanc", image: "profile12", status: false, points: 85),

    Helper(lastName: "Perrin", firstName: "Alice", email: "alice.perrin@example.com", phoneNumber: 1234567802, password: "aliceperrin", image: "profile13", status: true, points: 190),
    Helper(lastName: "Barbier", firstName: "Hugo", email: "hugo.barbier@example.com", phoneNumber: 1234567803, password: "hugobarbier", image: "profile14", status: false, points: 110),
    Helper(lastName: "Renard", firstName: "Chloé", email: "chloe.renard@example.com", phoneNumber: 1234567804, password: "chloerenard", image: "profile15", status: true, points: 230),
    Helper(lastName: "Legrand", firstName: "Thomas", email: "thomas.legrand@example.com", phoneNumber: 1234567805, password: "thomaslegrand", image: "profile16", status: false, points: 75),

    Helper(lastName: "Robin", firstName: "Camille", email: "camille.robin@example.com", phoneNumber: 1234567806, password: "camillerobin", image: "profile17", status: true, points: 180),
    Helper(lastName: "Gauthier", firstName: "Maxime", email: "maxime.gauthier@example.com", phoneNumber: 1234567807, password: "maxgauthier", image: "profile18", status: false, points: 105),
    Helper(lastName: "Lopez", firstName: "Sarah", email: "sarah.lopez@example.com", phoneNumber: 1234567808, password: "sarahlopez", image: "profile19", status: true, points: 205),
    Helper(lastName: "Fontaine", firstName: "Pierre", email: "pierre.fontaine@example.com", phoneNumber: 1234567809, password: "pierrepass", image: "profile20", status: false, points: 140)
]

