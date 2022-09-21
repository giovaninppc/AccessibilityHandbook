//
//  TheMagicPuzzle.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct TheMagicPuzzle: GamePage, View {
  var title: String = "The 'Magic' Puzzle"
  var completed: Bool { GameStates.theMagicPuzzleCompleted }

  let hintPage: AnyView = MagicTapPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("This puzzle is Magic!")
        Comment("I don't know what else to tell you...")
      }
      .toAny()
    } link: {
      hintPage
    }
    .accessibilityAction(.magicTap) {
      success = true
      GameStates.theMagicPuzzleCompleted = true
    }
  }
}
