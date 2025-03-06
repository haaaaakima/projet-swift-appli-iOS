//
//  HelpYApp.swift
//  HelpY
//
//  Created by Apprenant 45 on 29/01/2025.
//

import SwiftUI

@main
struct HelpYApp: App {
    @EnvironmentObject var viewModel: HelperViewModel
    var body: some Scene {
        WindowGroup {
            LandingScreenView()
                .environmentObject(HelperViewModel()) // Partage le ViewModel dans l'application
        }
    }
}
