//
//  TheUpsideDown.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct TheUpsideDown: GamePage, View {
  var title: String = "The Upside Down"
  var completed: Bool { GameStates.theUpsideDownCompleted }

  let hintPage: AnyView = InvertColorsPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("Maybe there is a way to see it.")
        Text("I feel so inverted")
          .foregroundColor(.background)
          .accessibilityIgnoresInvertColors()
        VerticalSpace(.large)
        VerticalSpace(.large)
        Button {
          success = true
          GameStates.theUpsideDownCompleted = true
        } label: {
          Text("Tap here to win!")
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
