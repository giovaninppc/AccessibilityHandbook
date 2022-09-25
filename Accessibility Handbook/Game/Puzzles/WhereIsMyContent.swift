//
//  WhereIsMyContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct WhereIsMyContent: GamePage, View {
  let title: String = L10n.WhereIsMyContent.title
  var completed: Bool { GameStates.whereIsMyContentCompleted }

  var hintPage: AnyView = AccessibilityLabelPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.WhereIsMyContent.text1)
        Text(L10n.WhereIsMyContent.text2)
          .foregroundColor(.background)
        Text(L10n.pumpkin)
          .foregroundColor(.background)
        Text(L10n.potato)
          .foregroundColor(.background)
        Text(L10n.iceCream)
          .foregroundColor(.background)
          .accessibilityAddTraits(.isButton)
          .accessibilityHint(L10n.WhereIsMyContent.hint)
          .accessibilityAction {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
            GameStates.whereIsMyContentCompleted = true
            success = true
          }
        Text(L10n.lobster)
          .foregroundColor(.background)
        Text(L10n.flag)
          .foregroundColor(.background)
      }
      .toAny()
    } link: {
      hintPage
    }
  }

  func hinted() {
    withAnimation {
      hinting = true
    }
  }
}
