//
//  GameView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct GameView: View {
  @State var count: Int = 0

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Text("Try solving these puzzles to learn more about accessibility features!")
        ForEach(Games.pages, id: \.id) { page in
          NavigationLink {
            page.page
          } label: {
            GameCell(title: page.title, completed: page.completed)
          }
        }
      }
      .padding()
    }
    .navigationTitle("Puzzles")
    .onAppear {
      count += 1
    }
  }
}
