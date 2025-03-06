//
//  NotificationsView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct NotificationsView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(requestsData) { request in
                        NavigationLink (destination: ListDetailsView(requestData: request)) {
                            HStack {
                                // VStack gauche
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(request.organization.name)
                                        .foregroundColor(.black)
                                    
                                    HStack {
                                        Image(systemName: request.icon)
                                            .resizable()
                                            .frame(width: 26, height: 26)
                                            .foregroundStyle(Color(red: 0.416, green: 0.729, blue: 0.965))
                                        Text(request.category)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("\(request.duration) minutes")
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading, 10)
                                
                                Spacer()
                                
                                // VStack droite
                                VStack(alignment: .trailing, spacing: 5) {
                                    Text(request.date, style: .date) // Affiche la date formatée
                                        .foregroundColor(.gray)
                                        .padding(.top, 10)
                                    Spacer()
                                    Text(request.statusRequired ? "Bénévole" : "Professionnel")
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                        .padding(.bottom, 15)
                                }
                                .padding(.trailing, 10)
                                
                            }
                            .frame(height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .padding(.horizontal, 30)
                        }
                    }
                    .padding(.top, 20)
                }
                .navigationTitle("Notifications")
            }
        }
    }
}

#Preview {
    NotificationsView()
}
