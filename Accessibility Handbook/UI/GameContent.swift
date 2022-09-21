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
        VStack(alignment: .leading, spacing: .regular) {
          VerticalSpace(.large)
          content()
          Spacer()
        }
        .padding()
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
        Image(systemName: "lightbulb.fill")
      }
      .accessibilityLabel(Text("Hint"))
      .accessibilityHint(Text("Activate to get a hint on how to solve this puzzle."))
    }
  }
}
