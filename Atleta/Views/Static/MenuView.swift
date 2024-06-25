//
//  MenuView.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var gameCenterManager = GameCenterManager.shared
    var body: some View {
        HStack{
            Spacer()
            Button(action: {
                gameCenterManager.startMatchmaking()
            }) {
                Text("Challenge")
            }.font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            Spacer()
            Button(action: {
                print("High Scores")
            }) {
                Text("High Scores")
            }.font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            Spacer()
        }
    }
}

#Preview {
    MenuView()
}
