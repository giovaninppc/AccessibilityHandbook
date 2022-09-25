//
//  BePatient.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct BePatient: GamePage, View {
  let title: String = L10n.BePatient.title
  var completed: Bool { GameStates.bePatientCompleted }

  let hintPage: AnyView = AccessibilityHintPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State var sequence: [Int] = []

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.BePatient.text)
        Comment(L10n.BePatient.comment)
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()

          gameItem(name: L10n.pencil, icon: "pencil", value: 3)
          gameItem(name: L10n.paper, icon: "doc.fill", value: 1)
          gameItem(name: L10n.paperPlane, icon: "paperplane.fill", value: 4)
          gameItem(name: L10n.book, icon: "book.fill", value: 2)
          gameItem(name: L10n.bell, icon: "bell.fill", value: 5)

          Spacer()
        }
      }
      .toAny()
    } link: {
      hintPage
    }
    .onChange(of: sequence) { newValue in
      guard !newValue.isEmpty else { return }

      var isOnTrack = true
      newValue.enumerated().forEach { (index, value) in
        if index != value - 1 {
          selection()
          sequence = []
          isOnTrack = false
          return
        }
      }

      guard isOnTrack, newValue.count == 5 else { return }
      success = true
      GameStates.bePatientCompleted = true
    }
  }

  @ViewBuilder
  func gameItem(name: String, icon: String, value: Int) -> some View {
    Button {
      sequence.append(value)
    } label: {
      Image(systemName: icon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 30.0, height: 30.0)
    }
    .accessibilityLabel(name)
    .accessibilityHint("\(value)")
  }
}
