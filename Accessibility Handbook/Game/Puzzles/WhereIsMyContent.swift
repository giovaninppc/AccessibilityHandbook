//
//  WhereIsMyContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct WhereIsMyContent: GamePage, View {
  var title: String = "Where is my content?"
  var completed: Bool = GameStates.whereIsMyContentCompleted

  var hintPage: AnyView = AccessibilityLabelPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      VStack(alignment: .leading, spacing: .regular) {
        Spacer()
          .frame(height: .large)
        Text("Come on, this one is pretty easy!")
        Text("You need to find the correct button to finish the puzzle by using the Voice-Over!")
          .foregroundColor(.background)
        Text("Pumpkin")
          .foregroundColor(.background)
        Text("Potato")
          .foregroundColor(.background)
        Text("Ice cream")
          .foregroundColor(.background)
          .accessibilityAddTraits(.isButton)
          .accessibilityHint(Text("Tap twice to win the game"))
          .accessibilityAction {
            UIAccessibility.post(notification: .screenChanged, argument: nil)
            GameStates.whereIsMyContentCompleted = true
            success = true
          }
        Text("Lobster")
          .foregroundColor(.background)
        Text("Flag")
          .foregroundColor(.background)
        Spacer()
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
