//
//  RatingData.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//
import SwiftUI

struct Rating: Identifiable {
    let id = UUID()
    var description: String
    var rating: Int
}

let ratingsData = [
    Rating(description: "Très bon travail, merci beaucoup !", rating: 5),
    Rating(description: "Aide efficace, je recommande.", rating: 4),
    Rating(description: "Service satisfaisant, peut mieux faire.", rating: 3),
    Rating(description: "Un peu déçu, communication à améliorer.", rating: 2),
    Rating(description: "Mauvaise expérience, non professionnel.", rating: 1),

    Rating(description: "Disponible et très aimable, merci !", rating: 5),
    Rating(description: "Service rapide et courtois.", rating: 4),
    Rating(description: "Correct mais sans plus.", rating: 3),
    Rating(description: "Peut mieux faire, manque de ponctualité.", rating: 2),
    Rating(description: "Ne recommande pas, pas sérieux.", rating: 1),

    Rating(description: "Excellente expérience, très professionnel.", rating: 5),
    Rating(description: "A répondu à toutes mes attentes.", rating: 4),
    Rating(description: "Service acceptable.", rating: 3),
    Rating(description: "Pas à la hauteur des attentes.", rating: 2),
    Rating(description: "Problèmes multiples, décevant.", rating: 1),

    Rating(description: "Merci pour votre aide précieuse.", rating: 5),
    Rating(description: "Satisfait du service.", rating: 4),
    Rating(description: "Bof, à revoir.", rating: 3),
    Rating(description: "Manque de rigueur.", rating: 2),
    Rating(description: "Très mauvaise expérience.", rating: 1)
]
