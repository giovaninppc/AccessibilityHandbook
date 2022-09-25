//
//  GameSuccessView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameSuccessView: View {
  let page: AnyView

  @Environment(\.dismiss)
  var dismiss

  @Environment(\.accessibilityReduceTransparency)
  var isReduceTransparencyEnabled

  @AccessibilityFocusState
  private var isSuccessFocused: Bool

  var body: some View {
    ZStack(alignment: .center) {
      background
      VStack(spacing: .regular) {
        Group {
          Text(L10n.GameSuccess.title)
            .font(.title.bold())
          Text(L10n.GameSuccess.subtitle)
        }
        .accessibilityElement(children: .combine)
        .accessibilityFocused($isSuccessFocused)

        VerticalSpace(.regular)
        Text(L10n.GameSuccess.text)
          .multilineTextAlignment(.center)
        NavigationLink(L10n.GameSuccess.suggestedReading) {
          page
        }
        Button {
          dismiss()
        } label: {
          Text(L10n.goBack)
            .font(.body.bold())
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
    .accessibilityAddTraits(.isModal)
    .ignoresSafeArea()
    .onAppear {
      haptic(.success)
      isSuccessFocused = true
    }
  }
}

private extension GameSuccessView {
  var background: some View {
    Group {
      if isReduceTransparencyEnabled {
        Rectangle()
          .foregroundColor(.background)
      } else {
        Rectangle()
          .foregroundColor(.clear)
          .background(.thinMaterial)
          .opacity(0.7)
      }
    }
  }
}
