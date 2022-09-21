//
//  GameView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct GameView: View {
  @State var count: Int = 0

  var completedPuzzles: [GamePage] {
    Games.pages.filter { $0.completed }
  }

  var uncompletedPuzzles: [GamePage] {
    Games.pages.filter { !$0.completed }
  }

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Comment("Try solving these puzzles to learn more about accessibility features!")
        uncompletedPuzzlesView
        completedPuzzlesView
      }
      .padding()
    }
    .navigationTitle("Puzzles")
    .onAppear {
      count += 1
    }
  }

  private var uncompletedPuzzlesView: some View {
    Group {
      if !uncompletedPuzzles.isEmpty {
        VerticalSpace(.large)
        Title("Unfinished Puzzles")
        ForEach(uncompletedPuzzles, id: \.id) { page in
          NavigationLink {
            page.page
          } label: {
            GameCell(title: page.title, completed: page.completed)
          }
        }
      }
    }
  }

  private var completedPuzzlesView: some View {
    Group {
      if !completedPuzzles.isEmpty {
        VerticalSpace(.regular)
        Title("Completed Puzzles")
        ForEach(completedPuzzles, id: \.id) { page in
          NavigationLink {
            page.page
          } label: {
            GameCell(title: page.title, completed: page.completed)
          }
        }
      }
    }
  }
}
