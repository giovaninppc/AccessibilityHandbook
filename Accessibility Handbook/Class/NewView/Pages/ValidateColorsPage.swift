//
//  HandleAllTheViewActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct ValidateColorsPage: View, Page {
  let title: String = L10n.ValidateColors.title

  @Environment(\.colorScheme)
  var colorScheme

  @State var initialColorScheme: ColorScheme = .light

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        disclaimer
        intro
        fixedColors
      }
      .toAny()
    }
    .onAppear {
      initialColorScheme = colorScheme
    }
  }
}

private extension ValidateColorsPage {
  @ViewBuilder
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.ColorsGuide.title, destination: IndexView.colorsDeeplink())
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.ValidateColors.text1)
    Text(L10n.ValidateColors.text2)
    Comment(L10n.ValidateColors.comment1)
    Text(L10n.ValidateColors.text3)
  }

  @ViewBuilder
  var fixedColors: some View {
    Title(L10n.ValidateColors.FixedBackground.title)
    Text(L10n.ValidateColors.FixedBackground.text1)
    nonAdaptableColorExample
    nonAdaptableColorCode
    Text(L10n.ValidateColors.FixedBackground.text2)
    Text(L10n.ValidateColors.FixedBackground.text3)
    semiAdaptableColorExample
    semiAdaptableColorCode
  }

  var nonAdaptableColorCode: some View {
    Code.swiftUI("""
    VStack {
      Text("...")
        .foregroundColor(\(initialColorScheme == .dark ? ".white" : ".black"))
    }
    .background(\(initialColorScheme == .dark ? ".black" : ".white"))
    """)
  }

  var semiAdaptableColorCode: some View {
    Code.swiftUI("""
    VStack {
      Text("...")
        .foregroundColor(.label)
    }
    .background(\(initialColorScheme == .dark ? ".black" : ".white"))
    """)
  }
}

private extension ValidateColorsPage {
  private var nonAdaptableTextColor: Color { initialColorScheme == .dark ? .white : .black }
  private var nonAdaptableBackgroundColor: Color { initialColorScheme == .dark ? .black : .white }

  @ViewBuilder
  var nonAdaptableColorExample: some View {
    VerticalSpace(.regular)
    Centered {
      VStack(spacing: .regular) {
        Text("Fixed color example")
          .foregroundColor(nonAdaptableTextColor)
          .fixedSize(horizontal: false, vertical: true)
          .font(.title)
          .multilineTextAlignment(.center)
        Text("These labels and backgrounds are using a fixed color")
          .foregroundColor(nonAdaptableTextColor)
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.center)
        Text("Change your color scheme and see how it behaves.")
          .foregroundColor(nonAdaptableTextColor)
          .font(.caption)
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.center)
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(nonAdaptableBackgroundColor)
      }
      .toAny()
    }
  }

  @ViewBuilder
  var semiAdaptableColorExample: some View {
    VerticalSpace(.regular)
    Centered {
      VStack(spacing: .regular) {
        Text("Semi-fixed color examples")
          .fixedSize(horizontal: false, vertical: true)
          .font(.title)
          .multilineTextAlignment(.center)
        Text("These labels are using the system color for the label, but the background is using a fixed color.")
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.center)
        Text("Change your color scheme and see how it behaves.")
          .font(.caption)
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.center)
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(nonAdaptableBackgroundColor)
      }
      .toAny()
    }
  }
}
