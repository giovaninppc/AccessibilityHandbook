//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HiddenObjectsPage: View, Page {
  let title: String = L10n.HiddenObjects.title

  var body: some View {
    PageContent(next: FigureDifferentFontScalesPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        hidingElements
      }
      .toAny()
    }
  }
}

private extension HiddenObjectsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.AccElem.title, destination: AccessibilityElementPage().deeplink)
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.HiddenObjects.text1)
    Text(L10n.HiddenObjects.text2)
    Text(L10n.HiddenObjects.text3)
    Text(L10n.HiddenObjects.text4)
  }

  @ViewBuilder
  var hidingElements: some View {
    Title(L10n.HiddenObjects.Hiding.title)
    Text(L10n.HiddenObjects.Hiding.text1)
    hidingSwiftUICode
    hidingUIKitCode
    Text(L10n.HiddenObjects.Hiding.text2)
    Text(L10n.HiddenObjects.Hiding.text3)
  }
}

private extension HiddenObjectsPage {
  var hidingSwiftUICode: some View {
    Code.uikit("""
    SeparatorView()
      .accessibilityHidden(true)
    """)
  }

  var hidingUIKitCode: some View {
    Code.uikit("""
    let separatorView = UIView()
    separatorView.isAccessibilityElement = false
    """)
  }
}
