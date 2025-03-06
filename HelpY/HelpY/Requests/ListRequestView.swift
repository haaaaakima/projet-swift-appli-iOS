//
//  ListRequestsView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct ListRequestView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(requestsData) { request in
                    NavigationLink(destination: ListDetailsView(requestData: request)) {
                        HStack(alignment: .center, spacing: 10) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(request.organization.name)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                
                                Text("\(request.category) - \(String(format:"%.1f", request.distance)) KM")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                
                                Text(request.date, style: .date)
                                    .foregroundColor(.gray)
                                
                                Text("\(request.duration) minutes")
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                HStack {
                                    Image(systemName: request.icon)
                                        .resizable()
                                        .frame(width: 30, height: 32)
                                        .foregroundColor(Color(red: 0.416, green: 0.729, blue: 0.965))
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(red: 0.416, green: 0.729, blue: 0.965))
                                }
                                Text(request.statusRequired ? "Bénévole" : "Professionnel")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                                    .padding(.top, 30)
                            }
                        }
                        .padding()
                        Divider()
                    }
                }
            }
            .navigationTitle("Liste des besoins")
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

#Preview {
    ListRequestView()
}




