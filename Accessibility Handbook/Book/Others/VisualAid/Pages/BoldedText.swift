//
//  BoldedText.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/10/22.
//

import SwiftUI

struct BoldedTextPage: View, Page {
  let title: String = L10n.BoldedText.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        code
        reference
      }
      .toAny()
    }
  }
}

private extension BoldedTextPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.BoldedText.Intro.text1)
    Text(L10n.BoldedText.Intro.text2)
    Text(L10n.BoldedText.Intro.text3)
    Comment(L10n.BoldedText.Intro.comment1)
  }

  @ViewBuilder
  var code: some View {
    Code.uikit(
      """
      let isBoldTextEnabled = UIAccessibility.isBoldTextEnabled
      UIFont.systemFont(
        ofSize: 16.0,
        weight: isBoldTextEnabled ? .bold : .regular
      )
      """
    )
    Text(L10n.BoldedText.Code.text1)
    Comment(L10n.BoldedText.Code.comment1)
    ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
  }

  @ViewBuilder
  var reference: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uiaccessibility/1615156-isboldtextenabled", title: self.title)
  }
}
