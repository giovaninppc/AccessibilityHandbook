//
//  TheMagicPuzzle.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct TheMagicPuzzle: GamePage, View {
  let title: String = L10n.TheMagicPuzzle.title
  var completed: Bool { GameStates.theMagicPuzzleCompleted }

  let hintPage: AnyView = MagicTapPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.TheMagicPuzzle.text)
          .accessibilityAction(.magicTap) {
            success = true
            GameStates.theMagicPuzzleCompleted = true
          }
        Comment(L10n.TheMagicPuzzle.comment)
          .accessibilityAction(.magicTap) {
            success = true
            GameStates.theMagicPuzzleCompleted = true
          }
      }
      .toAny()
    } link: {
      hintPage
    }
  }
}
