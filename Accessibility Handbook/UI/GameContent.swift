//
//  GameContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameContent: View {
  @Binding var success: Bool
  @Binding var hinting: Bool

  let content: () -> AnyView
  let link: () -> AnyView

  var body: some View {
    ZStack {
      ScrollView {
        HStack {
          VStack(alignment: .leading, spacing: .regular) {
            VerticalSpace(.large)
            content()
            Spacer()
          }
          .padding()
          Spacer()
        }
      }

      if success {
        GameSuccessView(page: link())
      }

      if hinting {
        HintView(link: link(), hinting: $hinting)
      }
    }
    .toolbar {
      Button {
        withAnimation {
          hinting = !hinting
          UIAccessibility.post(notification: .screenChanged, argument: nil)
        }
      } label: {
        Icon.lightbulb
      }
      .accessibilityLabel(L10n.hint)
      .accessibilityHint(L10n.Hint.hint)
    }
  }
}
