//
//  TheUpsideDown.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct TheUpsideDown: GamePage, View {
  let title: String = L10n.TheUpsideDown.title
  var completed: Bool { GameStates.theUpsideDownCompleted }

  let hintPage: AnyView = InvertColorsPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.TheUpsideDown.text1)
        Text(L10n.TheUpsideDown.text2)
          .foregroundColor(.background)
          .accessibilityIgnoresInvertColors()
        VerticalSpace(.large)
        VerticalSpace(.large)
        Button {
          success = true
          GameStates.theUpsideDownCompleted = true
        } label: {
          Text(L10n.tapToWin)
            .font(.body.bold())
            .foregroundColor(.background)
            .accessibilityIgnoresInvertColors()
        }
      }
      .toAny()
    } link: {
      hintPage
    }
  }
}
