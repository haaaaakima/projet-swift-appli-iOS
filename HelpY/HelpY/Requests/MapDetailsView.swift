//
//  MapDetailsView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI
import MapKit

struct MapDetailsView: View {
    @Environment(\.dismiss) var dismiss // Permet de fermer la vue actuelle
    @State private var navigateToLogin = false // Contrôle de la navigation vers LoginFormView
    var requestData: RequestData

    var body: some View {
        NavigationStack {
            ZStack {
                MapRequestView()
                    .blur(radius: 5)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5)
                        .frame(width: 360, height: 500)
                        .overlay(content: {
                            VStack(spacing: 15) {
                          
                                NavigationLink{
                                    MapRequestView()
                                }
                            label:
                                {
                                    Text("X")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.gray)
                                        .padding(.leading, 280)
                                        .padding()
                                }
                                
                                HStack {
                                    // VStack gauche
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(requestData.organization.name)
                                            .foregroundColor(.black)
                                        
                                        HStack {
                                            Image(systemName: requestData.icon)
                                                .resizable()
                                                .frame(width: 26, height: 26)
                                                .foregroundStyle(Color(red: 0.416, green: 0.729, blue: 0.965))
                                            Text(requestData.category)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        }
                                        
                                        Text("\(requestData.duration) minutes")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    // VStack droite
                                    VStack(alignment: .trailing, spacing: 5) {
                                        Text(requestData.date, style: .date) // Affiche la date formatée
                                            .foregroundColor(.gray)
                                            .padding(.top, 10)
                                        Spacer()
                                        Text(requestData.statusRequired ? "Bénévole" : "Professionnel")
                                            .foregroundColor(.white)
                                            .padding(7)
                                            .background(requestData.statusRequired ? Color.green : Color.orange)
                                            .cornerRadius(10)
                                            .padding(.bottom, 15)
                                    }
                                    .padding(.trailing, 10)
                                    
                                }
                                .frame(width: 295, height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0.8392156862745098, green: 0.8392156862745098, blue: 0.8392156862745098), lineWidth: 1)
                                )
                               
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Description de l'offre")
                                        .font(.headline)

                                    Text(requestData.description)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color(UIColor.systemGray5))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)

                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Durée")
                                        .font(.headline)

                                    Text("\(requestData.duration) minutes")
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color(UIColor.systemGray5))
                                        .cornerRadius(10)
                                }
                                .padding(.horizontal)
                                
                                NavigationLink{
                                    LoginFormView()}
                                label:
                                {
                                    Text("Accepter")
                                        .foregroundColor(.white)
                                        .frame(width: 140, height: 45)
                                        .background(Color.blue)
                                        .cornerRadius(12)
                                        .padding(.top, 10)
                                }
                            }
                            .padding(.horizontal)
                        })
                } .padding(.bottom, 80)
            }
        }
        .navigationBarBackButtonHidden(true) // Cacher le bouton par défaut
    }
}

#Preview {
    MapDetailsView(requestData: requestsData.first!)
}
