//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct NavigationAndDismissPage: View, Page {
  let title: String = L10n.NavigationAndDismiss.title

  var body: some View {
    PageContent(next: AccessibilityShortcutsPage(), deeplink: deeplink) {
      Group {
        intro
      }
      .fixedSize(horizontal: false, vertical: true)
      .toAny()
    }
  }
}

private extension NavigationAndDismissPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.NavigationAndDismiss.text1)
    Text(L10n.NavigationAndDismiss.text2)
    Text(L10n.NavigationAndDismiss.text3)
    Disclaimer.beforeYouReadThis(check: L10n.DismissPage.title, destination: DismissPage().deeplink)
    Comment(L10n.NavigationAndDismiss.comment1)
    Text(L10n.NavigationAndDismiss.text4)
    Text(L10n.NavigationAndDismiss.text5)
    Text(L10n.NavigationAndDismiss.text6)
    Comment(L10n.NavigationAndDismiss.comment2)
  }
}
