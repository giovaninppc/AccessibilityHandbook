//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HandleAnimationsPage: View, Page {
  let title: String = "HandleAnimationsPage"

  var body: some View {
    PageContent(next: NavigationAndDismissPage(), deeplink: deeplink) {
      Group {
        disclaimer
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
}
