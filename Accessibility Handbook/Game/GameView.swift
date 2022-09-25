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
        Comment(L10n.GameView.comment)
        uncompletedPuzzlesView
        completedPuzzlesView
      }
      .padding()
    }
    .navigationTitle(L10n.puzzles)
    .onAppear {
      count += 1
    }
  }

  private var uncompletedPuzzlesView: some View {
    Group {
      if !uncompletedPuzzles.isEmpty {
        VerticalSpace(.large)
        Title(L10n.unfinishedPuzzles)
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
        Title(L10n.completedPuzzles)
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
