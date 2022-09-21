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

  let hintPage: AnyView = AccessibilityPriorityPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var word: String = ""
  @FocusState private var fieldIsFocused: Bool

  var hasSucceeded: Bool {
    word == "46197"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      VStack(alignment: .leading, spacing: .regular) {
        Spacer()
          .frame(height: .large)
        Text("You need to type in the correct password!")
          .accessibilitySortPriority(20)
        Text("It's as simple as that")
          .accessibilitySortPriority(19)
        Comment("You just need to find out what the password is...")
          .accessibilitySortPriority(18)
        HStack {
          item("1")
            .accessibilitySortPriority(8)
          item("2")
            .accessibilityHidden(true)
          item("3")
            .accessibilityHidden(true)
          item("4")
            .accessibilitySortPriority(10)
          item("5")
            .accessibilityHidden(true)
        }
        HStack {
          item("6")
            .accessibilitySortPriority(9)
          item("7")
            .accessibilitySortPriority(6)
          item("8")
            .accessibilityHidden(true)
          item("9")
            .accessibilitySortPriority(7)
          item("0")
            .accessibilityHidden(true)
        }
        Spacer()
          .frame(height: .regular)
        TextField("Password", text: $word)
          .keyboardType(.numberPad)
          .focused($fieldIsFocused)
          .padding()
          .background(Color.secondaryBackground)
        Spacer()
      }
      .toAny()
    } link: {
      hintPage.toAny()
    }
    .onChange(of: hasSucceeded) { newValue in
      success = hasSucceeded
      fieldIsFocused = false
      if success {
        GameStates.findThePasswordCompleted = true
      }
    }
  }

  @ViewBuilder
  func item(_ title: String) -> some View {
    Text(title)
      .font(.title2)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 4.0)
          .foregroundColor(.secondaryBackground)
      }
  }
}
