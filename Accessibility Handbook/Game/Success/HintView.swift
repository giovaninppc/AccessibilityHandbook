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
            Image(systemName: "xmark")
          }
          .accessibilityLabel(Text("Close Hint"))
          Spacer()
            .frame(maxWidth: 250.0)
        }
        Image(systemName: "lightbulb.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
          .foregroundColor(.accentColor)
        Text("🤔 Having Trouble?")
          .font(.title.bold())
          .multilineTextAlignment(.center)
          .accessibilityFocused($isHintFocused)
        .accessibilityHidden(true)
        Text("The Handbook puzzles were made to be solved using some kind of accessibility tool.")
          .multilineTextAlignment(.center)
        Text("If you can't figure it out, maybe this page will help you...")
          .multilineTextAlignment(.center)
        NavigationLink {
          link
        } label: {
          Text("Open Hint")
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
