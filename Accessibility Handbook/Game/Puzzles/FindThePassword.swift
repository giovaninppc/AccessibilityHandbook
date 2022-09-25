//
//  FindThePassword.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct FindThePassword: GamePage, View {
  let title: String = L10n.FindThePassword.title
  var completed: Bool { GameStates.findThePasswordCompleted }

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
      Group {
        Text(L10n.FindThePassword.text1)
          .accessibilitySortPriority(20)
        Text(L10n.FindThePassword.text2)
          .accessibilitySortPriority(19)
        Comment(L10n.FindThePassword.comment)
          .accessibilitySortPriority(18)
        VerticalSpace(.regular)
        Centered {
          VStack {
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
          }
          .toAny()
        }
        VerticalSpace(.regular)
        TextField(L10n.password, text: $word)
          .keyboardType(.numberPad)
          .focused($fieldIsFocused)
          .padding()
          .background(Color.secondaryBackground)
      }
      .toAny()
    } link: {
      hintPage.toAny()
    }
    .onTapGesture {
      fieldIsFocused = false
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
