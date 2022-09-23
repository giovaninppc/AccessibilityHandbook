//
//  Outsider.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct SuperFriend: GamePage, View {
  var title: String = "Super friend"
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
        Text("There is an outsider")
        Comment("Find the person with the biggest amount of friends!")
        VerticalSpace(.large)
        HStack {
          Spacer()
          VStack(spacing: .regular) {
            Button("Jane") { bianca = true }
            Button("Michael") { ana = true }
            Button("Doug") { pedro = true }
            Button("Felipe") { filipe = true }
            Button("Bianca") { ana = true }
          }
          Spacer()
          VStack(spacing: .regular) {
            Button("Ana") { felipe = true }
            Button("Mario") { luigi = true }
            Button("Pedro") { bob = true }
            Button("Bob") { patrick = true }
            Button("Thiago") { ana = true }
          }
          Spacer()
          VStack(spacing: .regular) {
            Button("Bruno") { jane = true }
            Button("Dave") { thiago = true }
            Button("Luigi") { mario = true }
            Button("Filipe") { ana = true }
            Button("Patrick") { bob = true }
          }
          Spacer()
        }
        VerticalSpace(.large)
        TextField("Super friend name", text: $word)
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
