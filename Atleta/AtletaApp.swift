//
//  AtletaApp.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

@main
struct AtletaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                GameCenterManager.shared.authenticateUser()
            }
        }
    }
}
