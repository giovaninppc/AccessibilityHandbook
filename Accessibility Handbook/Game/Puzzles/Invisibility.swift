//
//  Impostor.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Invisibility: GamePage, View {
  let title: String = L10n.Invisibility.title
  var completed: Bool { GameStates.invisibilityCompleted }

  let hintPage: AnyView = ReduceTransparencyPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @Environment(\.accessibilityReduceTransparency) var isReduceTransparencyEnabled

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.Invisibility.text)
        Comment(L10n.Invisibility.comment)
          .accessibilityLabel(Text(isReduceTransparencyEnabled ? L10n.Invisibility.transparent : ""))
          .opacity(isReduceTransparencyEnabled ? 1.0 : 0.0)
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()
          Button {
            guard isReduceTransparencyEnabled else { return }
            success = true
            GameStates.invisibilityCompleted = true
          } label: {
            Text(L10n.tapToWin)
              .font(.body.bold())
              .foregroundColor(.primary)
              .padding()
              .background {
                RoundedRectangle(cornerRadius: 8.0)
                  .foregroundColor(.accentColor)
              }
          }
        }
        .accessibilityLabel(Text(isReduceTransparencyEnabled ? L10n.tapToWin : ""))
        .opacity(isReduceTransparencyEnabled ? 1.0 : 0.0)
      }
      .toAny()
    } link: {
      hintPage
    }
  }
}
