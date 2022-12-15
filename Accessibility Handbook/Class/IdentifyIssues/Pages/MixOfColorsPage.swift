//
//  MixOfColors.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 15/12/22.
//

import SwiftUI

struct MixOfColorsPage: View, Page {
  let title: String = L10n.MixOfColors.title

  @Environment(\.colorScheme)
  var colorScheme

  var isDarkMode: Bool {
    initialColorScheme == .dark
  }

  @State private var initialColorScheme: ColorScheme = .dark

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        disclaimer
        intro
        example
        counterExample
      }
      .toAny()
    }
    .onAppear {
      initialColorScheme = colorScheme
    }
  }
}

private extension MixOfColorsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.ValidateColors.title, destination: ValidateColorsPage().deeplink)
  }

  @ViewBuilder
  var intro: some View {
    Comment(L10n.MixOfColors.comment1)
    Text(L10n.MixOfColors.text1)
    Text(L10n.MixOfColors.text2)
  }

  @ViewBuilder
  var example: some View {
    Text(L10n.MixOfColors.Example.text1)
    Code.swiftUI("""
    struct MyView: View {
      var body: some View {
        Text("Super title")
          .padding()
          .background((\(isDarkMode ? ".black" : ".white")))
      }
    }
    """)
    Comment(L10n.MixOfColors.Example.comment1)
    Text(L10n.MixOfColors.Example.text2)
    Text(L10n.MixOfColors.Example.text3)
    Text("Super title")
      .padding()
      .background(isDarkMode ? .black : .white)
    Comment(L10n.MixOfColors.Example.comment2)
    Text(L10n.MixOfColors.Example.text4)
  }

  @ViewBuilder
  var counterExample: some View {
    Title(L10n.MixOfColors.CounterExample.title)
    Text(L10n.MixOfColors.CounterExample.text1)
    Text(L10n.MixOfColors.CounterExample.text2)
    Code.swiftUI("""
    struct PrimaryButton: View {
      var body: some View {
        Text("Super title")
          .padding()
          .foregroundColor(.white)
          .background(.pink)
      }
    }
    """)
    Text("Super title")
      .padding()
      .font(.callout.bold())
      .foregroundColor(.white)
      .background(.pink)
    Text(L10n.MixOfColors.CounterExample.text3)
  }
}
