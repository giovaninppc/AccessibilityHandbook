//
//  Impostor2.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Impostor2: GamePage, View {
  var title: String = "Impostor 2.0"
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
        Text("Find the impostor, and type it's name!")
        Comment("Ask them, maybe they'll tell you.")
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
        TextField("Type the impostor's name", text: $word)
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
      isImpostor ? haptic(.success) : selection()
    } label: {
      Image(systemName: "person.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30.0, height: 30.0)
    }
    .accessibilityLabel(Text(name))
  }
}
