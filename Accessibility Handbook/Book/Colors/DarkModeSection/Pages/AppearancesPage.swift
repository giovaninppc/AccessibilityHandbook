//
//  AppearancesPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct AppearancesPage: View, Page {
  let title: String = L10n.Appearances.title

  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    PageContent(next: DynamicColorsPage(), deeplink: deeplink) {
      Group {
        intro
        code
        doc
      }
      .toAny()
    }
  }
}

private extension AppearancesPage {
  var intro: some View {
    Group {
      Text(L10n.Appearances.Intro.text1)
      Text(L10n.Appearances.Intro.text2)
    }
  }

  var code: some View {
    Group {
      Title(L10n.Appearances.Code.title)
      Text(L10n.Appearances.Code.text1)
      Code.swiftUI(
        """
        @Environment(\\.colorScheme)
        var colorScheme

        var body: some View {
          if colorScheme == .dark { /* */ }
          if colorScheme == .light { /* */ }
        }
        """
      )
      Text(L10n.Appearances.Code.text2)
      Code.uikit(
        """
        traitCollection.userInterfaceStyle {
        case .light:
          // Handle light mode
        case .dark:
          // Handle dark mode
        case .unspecified:
          // Handle default mode
        }
        """
      )
      Comment(L10n.Appearances.Code.comment1)
      Text(L10n.Appearances.Code.text3)
      Code.uikit(
        """
        override func traitCollectionDidChange(
          _ previousTraitCollection: UITraitCollection?
        ) {
          switch traitCollection.userInterfaceStyle {
          case .dark:
            // Update colors to dark mode
          case .light:
            // Update colors to light mode
          case .unspecified:
            // Update colors to default
          }
        }
        """
      )
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/appearance_customization/supporting_dark_mode_in_your_interface", title: L10n.Appearances.supportingDarkMode)
  }
}
