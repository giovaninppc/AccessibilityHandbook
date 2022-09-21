//
//  FindThePassword.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct FindThePassword: GamePage, View {
  var title: String = "Find the Password"
  var completed: Bool = GameStates.findThePasswordCompleted

  let hintPage: AnyView = AccessibilityLabelPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      VStack(alignment: .leading, spacing: .regular) {
        Spacer()
          .frame(height: .large)
        Text("You need to type in the correct password!")
        Text("It's as simple as that")
        Comment("You just need to find out what the password is...")
        Spacer()
      }
      .toAny()
    } link: {
      hintPage.toAny()
    }
  }

  func hinted() {}
}
