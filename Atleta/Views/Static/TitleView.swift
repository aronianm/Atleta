//
//  TitleView.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
         VStack {
             HStack{
                 Spacer()
                 Text("Athleta")
                     .font(.largeTitle)
                     .fontWeight(.bold)
                     .foregroundColor(.white)
                     .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2) // Text shadow
                 
                 Spacer()
             }
             Spacer()
         }
         .padding()
         .background(
             LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing) // Gradient background
         )
         .cornerRadius(20) // Rounded corners
         .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5) // Overall shadow
     }
}

#Preview {
    TitleView()
}
