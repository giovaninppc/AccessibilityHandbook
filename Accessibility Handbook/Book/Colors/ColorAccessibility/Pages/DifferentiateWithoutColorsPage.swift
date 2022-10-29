//
//  DifferentiateWithoutColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct DifferentiateWithoutColorsPage: View, Page {
  var title: String = "Differentiate without colors"

  var body: some View {
    PageContent(next: InvertColorsPage(), deeplink: deeplink) {
      Group {
        intro
        handling
      }
      .toAny()
    }
  }
}

private extension DifferentiateWithoutColorsPage {
  var intro: some View {
    Group {
      Text(L10n.Differentiate.Intro.text1)
      Text(L10n.Differentiate.Intro.text2)
      Comment(L10n.Differentiate.Intro.comment1)
      Text(L10n.Differentiate.Intro.text3)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
      Text(L10n.Differentiate.Intro.text4)
      Text(L10n.Differentiate.Intro.text5)
      Asset.coloblindWireGame.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .accessibilityLabel(L10n.Differentiate.Intro.image)
      Comment(L10n.Differentiate.Intro.comment2)
    }
  }

  var handling: some View {
    Group {
      Text(L10n.Differentiate.Handle.text1)
      Code.uikit(
        """
        if UIAccessibility.shouldDifferentiateWithoutColor {
          // Handle differentiate without color
        }
        """
      )
      Text(L10n.Differentiate.Handle.text2)
      Code.uikit(
        """
        NotificationCenter
        .default
        .addObserver(
            forName: UIAccessibility.differentiateWithoutColorDidChangeNotification,
            object: nil,
            queue: nil
        ) {
          // Handle notification
        }
        """
      )
      Text(L10n.Differentiate.Handle.text3)
      Code.swiftUI(
        """
        @Environment(\\.accessibilityDifferentiateWithoutColor)
        var differentiateWithoutColor
        """
      )
      DocButton(link: "https://developer.apple.com/documentation/uikit/uiaccessibility/3043554-differentiatewithoutcolordidchan", title: title)
    }
  }
}
