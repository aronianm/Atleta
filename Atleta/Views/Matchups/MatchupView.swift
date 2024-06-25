//
//  MatchupView.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

struct MatchupView: View {
    @ObservedObject var gameCenterManager = GameCenterManager.shared
    var body: some View {
        VStack {
            Text("Matchup")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
            HStack{
                VStack{
                    Text("Player 1")
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    Text("Wins: 0")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Losses: 0")
                        .font(.title)
                        .fontWeight(.bold)
                }
                VStack{
                    Text("Player 2")
                        .font(.title)
                        .fontWeight(.bold)
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    Text("Wins: 0")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Losses: 0")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    MatchupView()
}
