//
//  BePatient.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct BePatient: GamePage, View {
  var title: String = "Be Patient"
  var completed: Bool { GameStates.bePatientCompleted }

  let hintPage: AnyView = AccessibilityHintPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State var sequence: [Int] = []

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("Tap the elements in the correct order!")
        Comment("Pacience is the key...")
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()

          gameItem(name: "Pencil", icon: "pencil", value: 3)
          gameItem(name: "Paper", icon: "doc.fill", value: 1)
          gameItem(name: "Paper plane", icon: "paperplane.fill", value: 4)
          gameItem(name: "Book", icon: "book.fill", value: 2)
          gameItem(name: "Bell", icon: "bell.fill", value: 5)

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
          haptic(.error)
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
    .accessibilityLabel(Text(name))
    .accessibilityHint(Text("\(value)"))
  }
}
