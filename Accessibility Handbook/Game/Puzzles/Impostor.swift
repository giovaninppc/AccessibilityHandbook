//
//  Impostor.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Impostor: GamePage, View {
  let title: String = L10n.Impostor.title
  var completed: Bool { GameStates.impostorCompleted }

  let hintPage: AnyView = AnnouncementPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var word: String = ""
  @FocusState private var fieldIsFocused: Bool

  var hasSucceeded: Bool {
    word.lowercased() == "bob"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.Impostor.text)
        Comment(L10n.Impostor.comment)
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()
          gameItem(name: "Jane", isImpostor: false)
          gameItem(name: "Mike", isImpostor: false)
          gameItem(name: "Jhon", isImpostor: false)
          gameItem(name: "Luke", isImpostor: false)
          gameItem(name: "Bob", isImpostor: true)
          gameItem(name: "Megan", isImpostor: false)
          Spacer()
        }
        VerticalSpace(.large)
        TextField(L10n.Impostor.field, text: $word)
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
        GameStates.impostorCompleted = true
      }
    }
  }

  @ViewBuilder
  func gameItem(name: String, isImpostor: Bool) -> some View {
    Button {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        UIAccessibility.post(
          notification: .announcement,
          argument: isImpostor ? L10n.Impostor.impostor : L10n.Impostor.hint
        )
      }
    } label: {
      Icon.person
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30.0, height: 30.0)
    }
    .accessibilityLabel(Text(name))
  }
}
