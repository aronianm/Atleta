//
//  ContentView.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameCenterManager = GameCenterManager.shared
    
    var body: some View {
        VStack {
            if gameCenterManager.isAuthenticated {
                TitleView()

                MenuView()
            } else {
                if gameCenterManager.isLoading {
                    SpinningView()
                        .padding()
                } else {
                    Button(action: {
                        gameCenterManager.authenticateUser()
                    }) {
                        Text("Login with Game Center")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color.green)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 5, x: 0, y: 5)
                    }
                }
            }
        }
        .onAppear {
            gameCenterManager.authenticateUser()
        }
    }
}


#Preview {
    ContentView()
}
