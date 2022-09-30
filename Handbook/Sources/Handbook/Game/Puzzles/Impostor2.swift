//
//  Impostor2.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Impostor2: GamePage, View {
  let title: String = L10n.Impostor2.title
  var completed: Bool { GameStates.impostor2Completed }

  let hintPage: AnyView = HapticsPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var word: String = ""
  @FocusState private var fieldIsFocused: Bool

  var hasSucceeded: Bool {
    word.lowercased() == "mike"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.Impostor2.text)
        Comment(L10n.Impostor2.comment)
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()
          gameItem(name: "Jane", isImpostor: false)
          gameItem(name: "Mike", isImpostor: true)
          gameItem(name: "Jhon", isImpostor: false)
          gameItem(name: "Luke", isImpostor: false)
          gameItem(name: "Bob", isImpostor: false)
          gameItem(name: "Megan", isImpostor: false)
          Spacer()
        }
        VerticalSpace(.large)
        TextField(L10n.Impostor2.field, text: $word)
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
        GameStates.impostor2Completed = true
      }
    }
  }

  @ViewBuilder
  func gameItem(name: String, isImpostor: Bool) -> some View {
    Button {
      isImpostor ? haptic(.error) : selection()
    } label: {
      Icon.person
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30.0, height: 30.0)
    }
    .accessibilityLabel(Text(name))
  }
}
