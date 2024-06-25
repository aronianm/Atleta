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
            Text("Athleta").font(.largeTitle).bold()
            Spacer()
        }.padding()
    }
}

#Preview {
    TitleView()
}
