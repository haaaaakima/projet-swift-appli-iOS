//
//  TabView.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

struct LandingScreenView: View {
    var body: some View {
        TabView {
            PickerButtonView()
                .tabItem {
                    Label("Demandes", systemImage: "mappin.and.ellipse")
            }
            NotificationsView()
                .tabItem {
                    Label("Notifications", systemImage: "bell.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle.fill")
                }
        }
    }
}

#Preview {
    LandingScreenView()
}
