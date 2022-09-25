//
//  HintView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HintView: View {
  let link: AnyView

  @Binding var hinting: Bool

  @AccessibilityFocusState
  private var isHintFocused: Bool

  @Environment(\.accessibilityReduceTransparency)
  var isReduceTransparencyEnabled

  var body: some View {
    ZStack {
      background
      VStack(alignment: .center, spacing: .regular) {
        HStack {
          Button {
            hinting = false
          } label: {
            Icon.close
          }
          .accessibilityLabel(L10n.Hint.close)
          Spacer()
            .frame(maxWidth: 250.0)
        }
        Icon.lightbulb
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
          .foregroundColor(.accentColor)
        Text(L10n.Hint.title)
          .font(.title.bold())
          .multilineTextAlignment(.center)
          .accessibilityFocused($isHintFocused)
        .accessibilityHidden(true)
        Text(L10n.Hint.text1)
          .multilineTextAlignment(.center)
        Text(L10n.Hint.text2)
          .multilineTextAlignment(.center)
        NavigationLink {
          link
        } label: {
          Text(L10n.Hint.open)
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
      isHintFocused = true
    }
  }
}

private extension HintView {
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
