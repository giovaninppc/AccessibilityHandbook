//
//  Outsider.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct SuperFriend: GamePage, View {
  let title: String = L10n.SuperFriend.title
  var completed: Bool { GameStates.superFriendCompleted }

  let hintPage: AnyView = ChangeCursorPositionPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var word: String = ""
  @FocusState private var fieldIsFocused: Bool

  @AccessibilityFocusState private var jane: Bool
  @AccessibilityFocusState private var michael: Bool
  @AccessibilityFocusState private var doug: Bool
  @AccessibilityFocusState private var felipe: Bool
  @AccessibilityFocusState private var bianca: Bool
  @AccessibilityFocusState private var ana: Bool
  @AccessibilityFocusState private var mario: Bool
  @AccessibilityFocusState private var pedro: Bool
  @AccessibilityFocusState private var bob: Bool
  @AccessibilityFocusState private var thiago: Bool
  @AccessibilityFocusState private var bruno: Bool
  @AccessibilityFocusState private var dave: Bool
  @AccessibilityFocusState private var luigi: Bool
  @AccessibilityFocusState private var filipe: Bool
  @AccessibilityFocusState private var patrick: Bool

  private var hasSucceeded: Bool {
    word.lowercased() == "ana"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.SuperFriend.text)
        Comment(L10n.SuperFriend.comment)
        VerticalSpace(.large)
        HStack {
          Spacer()
          VStack(spacing: .regular) {
            Button("Jane") { bianca = true }
              .accessibilityFocused($jane)
            Button("Michael") { ana = true }
              .accessibilityFocused($michael)
            Button("Doug") { pedro = true }
              .accessibilityFocused($doug)
            Button("Felipe") { filipe = true }
              .accessibilityFocused($felipe)
            Button("Bianca") { ana = true }
              .accessibilityFocused($bianca)
          }
          Spacer()
          VStack(spacing: .regular) {
            Button("Ana") { felipe = true }
              .accessibilityFocused($ana)
            Button("Mario") { luigi = true }
              .accessibilityFocused($mario)
            Button("Pedro") { bob = true }
              .accessibilityFocused($pedro)
            Button("Bob") { patrick = true }
              .accessibilityFocused($bob)
            Button("Thiago") { ana = true }
              .accessibilityFocused($thiago)
          }
          Spacer()
          VStack(spacing: .regular) {
            Button("Bruno") { jane = true }
              .accessibilityFocused($bruno)
            Button("Dave") { thiago = true }
              .accessibilityFocused($dave)
            Button("Luigi") { mario = true }
              .accessibilityFocused($luigi)
            Button("Filipe") { ana = true }
              .accessibilityFocused($filipe)
            Button("Patrick") { bob = true }
              .accessibilityFocused($patrick)
          }
          Spacer()
        }
        VerticalSpace(.large)
        TextField(L10n.SuperFriend.field, text: $word)
          .focused($fieldIsFocused)
          .padding()
          .background(Color.secondaryBackground)
      }
      .toAny()
    } link: {
      hintPage
    }
    .onTapGesture {
      fieldIsFocused = false
    }
    .onChange(of: hasSucceeded) { newValue in
      success = hasSucceeded
      fieldIsFocused = false
      if success {
        GameStates.superFriendCompleted = true
      }
    }
  }
}
