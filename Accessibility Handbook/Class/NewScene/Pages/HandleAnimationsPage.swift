//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HandleAnimationsPage: View, Page {
  let title: String = L10n.HandleAnimations.title

  var body: some View {
    PageContent(next: NavigationAndDismissPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
      }
      .toAny()
    }
  }
}

private extension HandleAnimationsPage {
  @ViewBuilder
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.motion, destination: IndexView.motionDeeplink())
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.HandleAnimations.text1)
    Text(L10n.HandleAnimations.text2)
    Comment(L10n.HandleAnimations.comment1)
    InternalLink(deeplink: ReduceMotionPage().deeplink, title: L10n.ReduceMotion.title)
  }
}
