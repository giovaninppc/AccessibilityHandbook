//
//  Impostor.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Impostor: GamePage, View {
  var title: String = "Impostor"
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
        Text("Find the impostor, and type it's name!")
        Comment("Ask them, maybe they'll tell you.")
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
          argument: isImpostor ? "Yes, I'm the impostor" : "I'm not the impostor"
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
