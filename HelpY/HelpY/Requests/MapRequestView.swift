//
//  MapRequestView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import MapKit
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            LoginFormView()
        } else {
            ZStack {
                Color.customBlue.edgesIgnoringSafeArea(.all)
                Image("logoBlancPNG")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 150)
                    .opacity(isActive ? 0 : 1)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct MapRequestView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.6045, longitude: 1.4442), // Centre de Toulouse
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )

    let requestData = requestsData // Utilisation des données avec des coordonnées

    // Récupérer les catégories uniques
    var uniqueCategories: [String] {
        var categoriesSet = Set<String>()
        requestData.forEach { categoriesSet.insert($0.category) }
        return Array(categoriesSet).sorted() // Trie les catégories par ordre alphabétique
    }

    // Filtre des requests en fonction de la catégorie et de la recherche
    var filteredRequests: [RequestData] {
        if searchText.isEmpty && selectedCategory == nil {
            return requestData
        } else {
            return requestData.filter {
                ($0.category.lowercased().contains(searchText.lowercased()) || searchText.isEmpty) &&
                (selectedCategory == nil || $0.category == selectedCategory)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                // Carte avec les épingles
                Map(coordinateRegion: $region, annotationItems: filteredRequests) { request in
                    // Utilisation des coordonnées de chaque demande pour les épingles
                    MapAnnotation(coordinate: request.coordinate) {
                        NavigationLink(destination: MapDetailsView(requestData: request)) {
                            VStack {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }

                // Barre de recherche
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Rechercher une catégorie", text: $searchText)
                            .padding(.leading, 5)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                    .frame(width: 360)
                    .padding(.top)

                    // Barre de filtres pour les catégories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(uniqueCategories, id: \.self) { category in
                                FilterChipView(category: category, isSelected: selectedCategory == category) {
                                    selectedCategory = selectedCategory == category ? nil : category
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 20)
                    }
                    Spacer()
                }
                .padding(.top, 50)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

// Style des filtres quand ils sont actifs
struct FilterChipView: View {
    var category: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Text(category)
            .font(.subheadline)
            .padding(10)
            .background(isSelected ? Color.blue : Color.white)
            .foregroundColor(isSelected ? Color.white : Color.black)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1)
            )
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    SplashScreenView()
}
