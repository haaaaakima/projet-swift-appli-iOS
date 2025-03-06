//
//  ProfileView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct ProfileView: View {
    let helper = helpersData[0]
    let maxRating = 5

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // Image et bouton pour éditer le profil
                    VStack {
                        Image(helper.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(180)
                        
                        NavigationLink(destination: ModifyProfileView()) {
                            Text("Editer le profil")
                                .foregroundColor(Color.blue)
                        }
                    } .padding(.trailing, 60)
                    // Texte avec nom, statut et points
                    VStack {
                        Text("Bienvenue \(helper.firstName) \(helper.lastName)")
                            .font(.title)
                        HStack {
                            VStack {
                                Text(helper.status ? "Bénévole" : "Professionnel")
                                Text("\(helper.points) points")
                            }
                            VStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.blue)
                                    .imageScale(.large)
                                    .padding(.leading, 20)
                            }
                        }.padding(.top, 5)
                    }
                }
                Divider()
                ScrollView {
                    // Section des avis
                    VStack {
                        HStack {
                            Text("Avis")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("(\(ratingsData.count))")
                                .foregroundStyle(Color.gray)
                        }
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Avis
                        ForEach(ratingsData) { rating in
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundStyle(Color(red: 0.416, green: 0.7294117647058823, blue: 0.9647058823529412))
                                
                                Text(rating.description)
                                    .font(.body)
                                    .padding(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    ForEach(1...maxRating, id: \.self) { index in
                                        Image(systemName: index <= rating.rating ? "star.fill" : "star")
                                            .foregroundColor(index <= rating.rating ? .yellow : .gray)
                                            .frame(width: 10, height: 10)
                                    }
                                }
                                .padding(.trailing, 5)
                                .frame(alignment: .trailing)
                            }
                            .padding(20)
                            Divider()
                        }
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}



