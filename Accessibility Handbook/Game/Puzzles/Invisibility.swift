//
//  Impostor.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Invisibility: GamePage, View {
  var title: String = "Invisibility"
  var completed: Bool { GameStates.invisibilityCompleted }

  let hintPage: AnyView = ReduceTransparencyPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State var isReduceTransparencyEnabled: Bool = UIAccessibility.isReduceTransparencyEnabled

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("I can't see anything...")
        Comment("Wait... Is this content TRANSPARENT?")
          .accessibilityLabel(Text(isReduceTransparencyEnabled ? "Wait... Is this content TRANSPARENT?" : ""))
          .opacity(isReduceTransparencyEnabled ? 1.0 : 0.0)
        VerticalSpace(.large)
        HStack(spacing: .large) {
          Spacer()
          Button {
            guard isReduceTransparencyEnabled else { return }
            success = true
            GameStates.invisibilityCompleted = true
          } label: {
            Text("Tap to win!")
              .font(.body.bold())
              .foregroundColor(.primary)
              .padding()
              .background {
                RoundedRectangle(cornerRadius: 8.0)
                  .foregroundColor(.accentColor)
              }
          }
        }
        .accessibilityLabel(Text(isReduceTransparencyEnabled ? "Tap to win!" : ""))
        .opacity(isReduceTransparencyEnabled ? 1.0 : 0.0)
      }
      .toAny()
    } link: {
      hintPage
    }
    .onAppear {
      NotificationCenter.default.addObserver(forName: UIAccessibility.reduceTransparencyStatusDidChangeNotification, object: nil, queue: nil) { _ in
        isReduceTransparencyEnabled = UIAccessibility.isReduceTransparencyEnabled
      }
    }
  }
}
